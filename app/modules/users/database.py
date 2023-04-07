from typing import AsyncGenerator

import sqlalchemy as sa
from fastapi import Depends
from fastapi_users.db import SQLAlchemyBaseUserTableUUID, SQLAlchemyUserDatabase
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine
from sqlalchemy.ext.declarative import DeclarativeMeta, declarative_base
from sqlalchemy.orm import sessionmaker

from app.core.global_config import app_config

DATABASE_URL = (
    f"postgresql+asyncpg://{app_config.POSTGRES_USER}:{app_config.POSTGRES_PASSWORD}@{app_config.POSTGRES_SERVER}"
    f":{app_config.POSTGRES_PORT}/{app_config.POSTGRES_DB}"
)
Base: DeclarativeMeta = declarative_base()

user_role_type = sa.Enum("platform", "client", name="user_role_type")


class User(SQLAlchemyBaseUserTableUUID, Base):
    __tablename__ = "users"
    role_type = sa.Column(user_role_type, nullable=False, default="platform")
    role_reference_id = sa.Column(UUID(as_uuid=True), nullable=True)


engine = create_async_engine(DATABASE_URL)
async_session_maker = sessionmaker(engine, class_=AsyncSession, expire_on_commit=False)


async def get_async_session() -> AsyncGenerator[AsyncSession, None]:
    async with async_session_maker() as session:
        yield session


async def get_user_db(session: AsyncSession = Depends(get_async_session)):
    yield SQLAlchemyUserDatabase(session, User)
