"""create table customers

Revision ID: 107e0ea1b436
Revises:
Create Date: 2025-09-12 13:10:30.675394

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '107e0ea1b436'
down_revision = None
branch_labels = None
depends_on = None


def upgrade() -> None:
    op.create_table('customers',
                    sa.Column('id', sa.UUID(), autoincrement=False, nullable=False),
                    sa.Column('name', sa.VARCHAR(55), nullable=False, comment="Customer's name"),
                    sa.Column('email', sa.VARCHAR(55), nullable=False, comment="Customer's e-mail"),
                    sa.Column('is_deleted', sa.BOOLEAN(), nullable=False, comment='Document is deleted'),
                    sa.Column('created_at', sa.TIMESTAMP(), nullable=False),
                    sa.Column('updated_at', sa.TIMESTAMP(), nullable=False),
                    sa.PrimaryKeyConstraint('id', name='customers_pkey'),
                    sa.UniqueConstraint('email')
                    )


def downgrade() -> None:
    op.drop_table('customers')
