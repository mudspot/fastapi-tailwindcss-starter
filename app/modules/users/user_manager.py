import uuid
from typing import Optional

from fastapi import Depends, Request
from fastapi_users import BaseUserManager, FastAPIUsers, UUIDIDMixin
from fastapi_users.authentication import (
    AuthenticationBackend,
    BearerTransport,
    JWTStrategy,
)
from fastapi_users.db import SQLAlchemyUserDatabase

from app.core import global_state
from app.core.global_config import app_config
from app.modules.users.database import User, get_user_db
from app.modules.users.user_auth_strategy import UserAuthStrategy


class UserManager(
    UUIDIDMixin,
    BaseUserManager[User, uuid.UUID],
):
    reset_password_token_secret = app_config.SECRET_KEY
    verification_token_secret = app_config.SECRET_KEY

    async def on_after_register(self, user: User, request: Optional[Request] = None):
        print(f"User {user.id} has registered.")

    async def on_after_forgot_password(
        self, user: User, token: str, request: Optional[Request] = None
    ):
        # await fn_send_reset_password_email(user.id, user.email, token)
        ...

    async def on_after_request_verify(
        self, user: User, token: str, request: Optional[Request] = None
    ):
        # await fn_send_verification_email(user.id, user.email, token)
        ...

    async def on_after_login(
        self,
        user: User,
        request: Optional[Request] = None,
    ):
        ...


async def get_user_manager(user_db: SQLAlchemyUserDatabase = Depends(get_user_db)):
    yield UserManager(user_db)


bearer_transport = BearerTransport(tokenUrl="/auth/login")


def get_jwt_strategy() -> JWTStrategy:
    return UserAuthStrategy(secret=app_config.SECRET_KEY, lifetime_seconds=3600)


auth_backend = AuthenticationBackend(
    name="jwt",
    transport=bearer_transport,
    get_strategy=get_jwt_strategy,
)

system_users = FastAPIUsers[User, uuid.UUID](get_user_manager, [auth_backend])
global_state.system_users = system_users
