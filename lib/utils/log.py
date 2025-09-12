import logging
import sys
from datetime import time
from logging.handlers import TimedRotatingFileHandler
from pathlib import Path

from lib.core.config import settings


def setup():
    logger = logging.getLogger()
    if settings.DEBUG:
        logger.setLevel(logging.DEBUG)
    else:
        logger.setLevel(logging.INFO)

    logging.getLogger("uvicorn").handlers.clear()
    logging.getLogger("uvicorn.access").handlers.clear()
    logging.getLogger("SAWarning").handlers.clear()
    uvicorn_error_logger = logging.getLogger("uvicorn.error")
    uvicorn_error_logger.name = ""

    logger.propagate = False
    log_format = logging.Formatter(f"%(asctime)s %(levelname)s [%(process)d-%(pathname)s.%(funcName)s:%(lineno)s] %(message)s")

    console_handler = logging.StreamHandler(sys.stdout)
    console_handler.setFormatter(log_format)
    logger.addHandler(console_handler)

    log_dir = Path(f"logs").expanduser().resolve()
    log_dir.mkdir(parents=True, exist_ok=True)
    file_handler = TimedRotatingFileHandler(log_dir / f"auditor.log", when='midnight', atTime=time(hour=1), utc=True)
    file_handler.setFormatter(log_format)
    logger.addHandler(file_handler)


logger = logging.getLogger()
