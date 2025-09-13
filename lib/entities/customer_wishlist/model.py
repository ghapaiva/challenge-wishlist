from sqlalchemy import Column, ForeignKey, UUID

from lib.entities._base.model import Base


class CustomerWishlist(Base):
    __tablename__ = "customer_wishlists"

    customer_id = Column(UUID(as_uuid=True), ForeignKey("customers.id", ondelete='CASCADE'), nullable=False, comment="Customer's id fk")
    product_id = Column(UUID(as_uuid=True), nullable=False, comment="Product's id fk")
