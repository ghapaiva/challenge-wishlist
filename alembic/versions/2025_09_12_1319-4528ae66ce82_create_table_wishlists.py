"""create table wishlists

Revision ID: 4528ae66ce82
Revises: 107e0ea1b436
Create Date: 2025-09-12 13:19:06.688098

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '4528ae66ce82'
down_revision = '107e0ea1b436'
branch_labels = None
depends_on = None


def upgrade() -> None:
    op.create_table('customer_wishlists',
                    sa.Column('id', sa.UUID(), autoincrement=False, nullable=False),
                    sa.Column('customer_id', sa.UUID(), nullable=False, comment="Customer's id fk"),
                    sa.Column('product_id', sa.UUID(), nullable=False, comment="Product's id fk"),
                    sa.Column('created_at', sa.TIMESTAMP(), nullable=False),
                    sa.Column('updated_at', sa.TIMESTAMP(), nullable=False),
                    sa.PrimaryKeyConstraint('id', name='customer_wishlists_pkey'),
                    sa.ForeignKeyConstraint(['customer_id'], ['customers.id'], name='customer_wishlists__customer_id_fkey'),
                    sa.UniqueConstraint('customer_id', 'product_id')
                    )


def downgrade() -> None:
    op.drop_table('customer_wishlists')
