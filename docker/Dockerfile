FROM python:3.11-alpine3.19 AS base

WORKDIR /home/app/

RUN apk update && \
    apk add --no-cache postgresql-dev gcc python3-dev musl-dev \
    libffi-dev unixodbc-dev build-base

COPY ./requirements/ ./requirements/
RUN python -m pip install --upgrade pip setuptools
RUN python -m pip install -r requirements/requirements.txt
RUN python -m pip install pydantic-settings
RUN python -m pip install gunicorn==20.1.0 uvloop httptools

COPY . .

EXPOSE 8000

RUN chmod +x /home/app/entrypoint.sh
CMD [ "/bin/sh", "/home/app/entrypoint.sh" ]
