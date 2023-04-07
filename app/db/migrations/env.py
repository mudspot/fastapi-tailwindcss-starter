import logging
import os
import pathlib
import sys
from logging.config import fileConfig
from sqlite3 import DatabaseError

import alembic
from sqlalchemy import create_engine, engine_from_config, pool

# we're appending the app directory to our path here so that we can import config easily
sys.path.append(str(pathlib.Path(__file__).resolve().parents[3]))

from app.core.global_config import app_config  # noqa

# Alembic Config object, which provides access to values within the .ini file
config = alembic.context.config

# Interpret the config file for logging
fileConfig(config.config_file_name)
logger = logging.getLogger("alembic.env")

database_url = (
    f"postgresql://{app_config.POSTGRES_USER}:{app_config.POSTGRES_PASSWORD}@{app_config.POSTGRES_SERVER}"
    f":{app_config.POSTGRES_PORT}/{app_config.POSTGRES_DB}"
)
test_database_url = f"{database_url}_test"


def run_migrations_online() -> None:
    """
    Run migrations in 'online' mode
    """
    is_test = os.environ.get("TEST")
    # handle testing config for migrations
    if is_test:
        # connect to primary db
        default_engine = create_engine(str(database_url), isolation_level="AUTOCOMMIT")
        # drop testing db if it exists and create a fresh one
        with default_engine.connect() as default_conn:
            default_conn.execute(
                f"DROP DATABASE IF EXISTS {app_config.POSTGRES_DB}_test"
            )
            default_conn.execute(f"CREATE DATABASE {app_config.POSTGRES_DB}_test")

    connectable = config.attributes.get("connection", None)
    config.set_main_option(
        "sqlalchemy.url", str(test_database_url if is_test else database_url)
    )
    if connectable is None:
        connectable = engine_from_config(
            config.get_section(config.config_ini_section),
            prefix="sqlalchemy.",
            poolclass=pool.NullPool,
        )

    with connectable.connect() as connection:
        alembic.context.configure(connection=connection, target_metadata=None)
        with alembic.context.begin_transaction():
            alembic.context.run_migrations()


def run_migrations_offline() -> None:
    """
    Run migrations in 'offline' mode.
    """
    if os.environ.get("TEST"):
        raise DatabaseError(
            "Running testing migrations offline currently not permitted."
        )

    alembic.context.configure(url=str(database_url))
    with alembic.context.begin_transaction():
        alembic.context.run_migrations()


if alembic.context.is_offline_mode():
    logger.info("Running migrations offline")
    run_migrations_offline()
else:
    logger.info("Running migrations online")
    run_migrations_online()
