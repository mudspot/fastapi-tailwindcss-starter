import os

import asyncpg
from fastapi import FastAPI
from loguru import logger

from app.core.global_config import app_config


async def connect_to_db(app: FastAPI) -> None:
    database_url = (
        f"postgresql://{app_config.POSTGRES_USER}:{app_config.POSTGRES_PASSWORD}@{app_config.POSTGRES_SERVER}"
        f":{app_config.POSTGRES_PORT}/{app_config.POSTGRES_DB}"
    )
    if os.environ.get("TEST"):
        database_url += "_test"

    try:
        connection = await asyncpg.connect(database_url)
        app.state.db = connection
        logger.info(
            "--- DB CONNECTION ESTABLISHED TO {}---".format(app_config.POSTGRES_SERVER)
        )
    except Exception as e:
        logger.warning("--- DB CONNECTION ERROR ---")
        logger.warning(e)
        logger.warning("--- DB CONNECTION ERROR ---")


async def close_db_connection(app: FastAPI) -> None:
    try:
        await app.state.db.close()
    except Exception as e:
        logger.warning("--- DB DISCONNECT ERROR ---")
        logger.warning(e)
        logger.warning("--- DB DISCONNECT ERROR ---")
