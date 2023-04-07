from typing import Callable

from fastapi import FastAPI

from .users import schema


def mount(app: FastAPI) -> Callable:
    async def start_app() -> None:
        from app.modules.users.user_manager import auth_backend, system_users

        app.include_router(
            system_users.get_auth_router(auth_backend, requires_verification=True),
            prefix="/auth",
            tags=["auth"],
        )

        app.include_router(
            system_users.get_reset_password_router(),
            prefix="/auth",
            tags=["auth"],
        )

        app.include_router(
            system_users.get_verify_router(schema.UserRead),
            prefix="/auth",
            tags=["auth"],
        )

    return start_app
