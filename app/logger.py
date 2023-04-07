from __future__ import annotations

import logging
import sys

from fastapi import Request
from loguru import logger

from app.core.global_config import app_config


class InterceptHandler(logging.Handler):
    def emit(self, record):
        # Get corresponding Loguru level if it exists
        try:
            level = logger.level(record.levelname).name
        except ValueError:
            level = record.levelno

        # Find caller from where originated the logged message
        frame, depth = logging.currentframe(), 2
        while frame.f_code.co_filename == logging.__file__:
            frame = frame.f_back
            depth += 1

        logger.opt(depth=depth, exception=record.exc_info).log(
            level, record.getMessage()
        )


# [UTCtimestamp][Severity][Method][ReponseCode][ResponseTime][Category][Component][HashedIP]
# [Request Id][namespace][free-form body as json]
def format_record(record: dict) -> str:
    format_string = "[{time:YYYY-MM-DDTHH:mm:ss.SSS}Z][{level}]"
    request_state = record["extra"].get("request_state")

    ip, component, response_code, method, category = None, None, None, None, "event"
    if record["function"] == "sentry_patched_callhandlers":
        message_tokens = record["message"].split()
        if len(message_tokens) == 6:
            ip_, _x, method_, component, _y, response_code = record["message"].split()
            ip = ip_.split(":")[0]
            method = method_[1:]
            category = "api"

    if request_state is None:
        format_string += "[no-method]" if method is None else "[{}]".format(method)
    else:
        format_string += "[{}]".format(request_state.request_method)

    format_string += (
        "[no-response-code]" if response_code is None else "[{}]".format(response_code)
    )

    response_time = record["elapsed"].total_seconds()
    format_string += "[{}]".format(response_time)
    format_string += "[{}]".format(category)
    format_string += "[{function}:{line}]"

    request_ip = None if request_state is None else request_state.request_ip
    if request_ip is not None:
        format_string += (
            "[{}]".format(request_ip) if app_config.IP_LOGGING else "[hidden-ip]"
        )
    else:
        format_string += "[no-ip]" if ip is None else "[{}]".format(ip)

    if request_state is not None:
        format_string += "[{}]".format(request_state.request_id)
    else:
        format_string += "[no-request-id]"

    if component is not None:
        record["message"] = ""
        record["name"] = component

    format_string += "[{name}][{message}]"
    format_string += "[{exception}]\n"
    return format_string


def setup_logging():
    loggers = (
        logging.getLogger(name)
        for name in logging.root.manager.loggerDict
        if name.startswith("uvicorn.") and not name.startswith("uvicorn.access")
    )
    for uvicorn_logger in loggers:
        uvicorn_logger.handlers = []

    # change handler for default uvicorn logger
    intercept_handler = InterceptHandler()
    logging.getLogger("uvicorn").handlers = [intercept_handler]
    logging.getLogger("uvicorn.access").handlers = [intercept_handler]

    # set logs output, level and format
    logger.configure(
        handlers=[{"sink": sys.stdout, "level": logging.DEBUG, "format": format_record}]
    )


def log_instance(request: Request):
    return logger if request is None else logger.bind(request_state=request.state)
