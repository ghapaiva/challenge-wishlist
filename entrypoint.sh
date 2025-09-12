#!/bin/sh
alembic upgrade head
exec uvicorn wsgi:app --host 0.0.0.0 --port 8000 --workers 2 --reload