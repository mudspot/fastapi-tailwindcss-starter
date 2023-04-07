from typing import Optional

from app.models.core import CoreModel


class ErrorModel(CoreModel):
    code: str
    message: str


class Error(ErrorModel):
    email: Optional[str]
    url: Optional[str]
