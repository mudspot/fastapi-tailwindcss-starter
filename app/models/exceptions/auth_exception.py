from typing import Any

from app.models.exceptions.core_exception import ErrorModel


class AuthenticationError(ErrorModel):
    code = "not-authenticated"


class AuthorizationError(ErrorModel):
    code = "not-authorized"


class InactiveStatusException(Exception):
    def __init__(
        self,
        *,
        error_code: str = "inactive-status",
        message: str = "Item is inactive.",
        details: Any = None
    ):
        self.error_code = error_code
        self.message = message
        self.details = details


class InactiveStatusError(ErrorModel):
    details: Any
