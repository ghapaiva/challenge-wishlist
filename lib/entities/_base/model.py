import uuid
from sqlalchemy import Boolean, Column, func, UUID
from sqlalchemy.ext.declarative import as_declarative, declared_attr

from lib.decorators.UTCMinus3DateTime import UTCMinus3DateTime


@as_declarative()
class Base(object):
    @declared_attr
    def __tablename__(cls):
        return cls.__name__.lower()

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4, unique=True)
    is_deleted = Column(Boolean, nullable=False, default=False)
    created_at = Column(UTCMinus3DateTime, nullable=False, default=func.now())
    updated_at = Column(UTCMinus3DateTime, nullable=False, default=func.now(), onupdate=func.now(), server_onupdate=func.now())
