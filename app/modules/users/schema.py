import uuid

from fastapi_users import schemas


class UserRead(schemas.BaseUser[uuid.UUID]):
    ...


class UserCreate(schemas.BaseUserCreate):
    ...


class UserUpdate(schemas.BaseUserUpdate):
    ...
