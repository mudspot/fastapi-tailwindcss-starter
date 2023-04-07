from typing import Any, Callable, Type

from fastapi import Depends, Request

from app.db.base import BaseRepository


def get_connection(request: Request):
    return request.app.state.db


def get_repository(repo_type: Type[BaseRepository]) -> Callable:
    def get_repo(db=Depends(get_connection)) -> Any:
        return repo_type(db)

    return get_repo
