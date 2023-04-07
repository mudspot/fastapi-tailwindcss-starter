"""create_users_table

Revision ID: a34a9fb54c9c
Revises: 96458a3f0016
Create Date: 2023-04-05 22:39:03.565072

"""
import sqlalchemy as sa
from alembic import op
from sqlalchemy.dialects.postgresql import UUID

# revision identifiers, used by Alembic.
revision = "a34a9fb54c9c"
down_revision = "96458a3f0016"
branch_labels = None
depends_on = None


user_role_type = sa.Enum("platform", "client", name="user_role_type")


def create_users_table() -> None:
    op.create_table(
        "users",
        sa.Column(
            "id",
            UUID(as_uuid=True),
            primary_key=True,
            server_default=sa.text("uuid_generate_v4()"),
        ),
        sa.Column("email", sa.VARCHAR, nullable=False),
        sa.Column("hashed_password", sa.VARCHAR, nullable=False),
        sa.Column("is_active", sa.BOOLEAN, nullable=False),
        sa.Column("is_superuser", sa.BOOLEAN, nullable=False),
        sa.Column("is_verified", sa.BOOLEAN, nullable=False),
        sa.Column(
            "role_type",
            user_role_type,
            nullable=False,
            server_default=sa.text("'platform'::user_role_type"),
        ),
        sa.Column("role_reference_id", UUID(as_uuid=True), nullable=True),
        sa.Column(
            "created_at", sa.TIMESTAMP, nullable=False, server_default=sa.text("now()")
        ),
        sa.Column("updated_at", sa.TIMESTAMP, nullable=True),
        sa.UniqueConstraint("email"),
    )


def upgrade() -> None:
    create_users_table()


def downgrade() -> None:
    op.drop_table("users")
    user_role_type.drop(op.get_bind())
