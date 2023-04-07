"""create_pg_extensions

Revision ID: 96458a3f0016
Revises:
Create Date: 2023-04-05 19:57:02.726094

"""
from alembic import op
from sqlalchemy.sql.expression import text

# revision identifiers, used by Alembic.
revision = "96458a3f0016"
down_revision = None
branch_labels = None
depends_on = None


def upgrade() -> None:
    op.execute(text('CREATE EXTENSION IF NOT EXISTS "pgcrypto";'))
    op.execute(text('CREATE EXTENSION IF NOT EXISTS "uuid-ossp";'))


def downgrade() -> None:
    pass
