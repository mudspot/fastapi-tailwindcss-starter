from typing import Callable

from fastapi import FastAPI


def mount(app: FastAPI) -> Callable:
    async def start_app() -> None:
        from app.routes.views import root_route

        app.include_router(root_route.router)

    return start_app
