from datetime import timedelta, timezone
from sqlalchemy import DateTime
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.types import TypeDecorator

Base = declarative_base()


class UTCMinus3DateTime(TypeDecorator):
    cache_ok = True
    impl = DateTime(timezone=True)
    
    def process_result_value(self, value, dialect):
        if value is not None:
            new_date = value.replace(tzinfo=timezone.utc)
            tz = timezone(timedelta(hours=-3))
            value = new_date.astimezone(tz)
        return value
