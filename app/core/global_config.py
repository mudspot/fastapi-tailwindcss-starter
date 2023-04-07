import os
from typing import Optional

from pydantic import BaseSettings

INIT_API_VERSION = "1.0.0-20230405"
INIT_API_ALGORITHM = "HS256"
INIT_API_ACCESS_TOKEN_EXPIRY = 3600


class GlobalConfig(BaseSettings):
    """Global configurations."""

    ENV_STATE: Optional[str] = os.environ.get("ENV_STATE", "dev")

    SECRET_KEY: Optional[str] = os.environ.get("SECRET_KEY", None)
    POSTGRES_USER: Optional[str] = os.environ.get("POSTGRES_USER", None)
    POSTGRES_PASSWORD: Optional[str] = os.environ.get("POSTGRES_PASSWORD", None)
    POSTGRES_SERVER: Optional[str] = os.environ.get("POSTGRES_SERVER", None)
    POSTGRES_PORT: Optional[str] = os.environ.get("POSTGRES_PORT", None)
    POSTGRES_DB: Optional[str] = os.environ.get("POSTGRES_DB", None)
    API_VERSION: Optional[str] = os.environ.get("API_VERSION", INIT_API_VERSION)
    API_ALGORITHM: Optional[str] = os.environ.get("API_ALGORITHM", INIT_API_ALGORITHM)
    API_ACCESS_TOKEN_EXPIRY: Optional[int] = os.environ.get(
        "API_ACCESS_TOKEN_EXPIRY", INIT_API_ACCESS_TOKEN_EXPIRY
    )


app_config = GlobalConfig()
# print(config.__repr__())
