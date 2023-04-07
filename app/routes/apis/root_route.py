from fastapi import APIRouter, Request
from fastapi.responses import HTMLResponse
from jinja2 import Template

from app.core.global_config import app_config

router = APIRouter()
router.prefix = "/api"


@router.get(
    "/healthz", tags=["systems"], name="root:health", operation_id="root_health"
)
async def healthz(request: Request):
    return {
        "version": app_config.API_VERSION,
    }


@router.get(
    "/echo-ip",
    tags=["systems"],
    name="root:echo-ip",
    operation_id="root_ip",
)
async def echo_ip(request: Request):
    import socket

    import requests

    # Get the container's hostname
    hostname = socket.gethostname()

    # Look up the IP address of the hostname
    ip_address = socket.gethostbyname(hostname).split(".")
    ip_address[-1] = "1"
    gateway_ip = ".".join(ip_address)

    url = "http://{}:5200/api/providers/aoeuaoeu".format(gateway_ip)
    headers = {"Content-Type": "application/json"}
    data = {"payload": "hello world"}

    response = requests.post(url, headers=headers, json=data)

    return response.json()


@router.get(
    "/jinjin",
    tags=["systems"],
    name="root:jinjin",
    operation_id="root_jinjin",
    response_class=HTMLResponse,
)
async def jinjin(request: Request):
    template = Template(open("app/templates/reset_password.html").read())
    return template.render()
