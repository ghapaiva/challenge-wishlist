import json
from typing import List

from lib.service.partner.products.schema import ProductBase


def get_all() -> List[ProductBase]:
    PRODUCTS_FILE = "/home/app/products.json"
    with open(PRODUCTS_FILE, "r", encoding="utf-8") as f:
        products = json.load(f)
    return products
