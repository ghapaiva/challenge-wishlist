import json
import uuid
from typing import List, Optional

from lib.service.partner.products.schema import ProductBase


def get_all() -> List[ProductBase]:
    """
    Return all products from partner
    This method is mocked. When the API is done, this method must be replaced by using requests lib to access API
    Returns:
        A list of product base (List[ProductBase])
    """
    PRODUCTS_FILE = "/home/app/products.json"
    with open(PRODUCTS_FILE, "r", encoding="utf-8") as f:
        products = json.load(f)
    return products


def get(id: uuid.UUID) -> Optional[ProductBase]:
    """
    Return the product by the id
    This method is mocked. When the API is done, this method must be replaced by using requests lib to access API
    Args:
        Product primary key (id: uuid.UUID)
    Returns:
        An optional product schema (Optional[ProductBase])
    """
    PRODUCTS_FILE = "/home/app/products.json"
    with open(PRODUCTS_FILE, "r", encoding="utf-8") as f:
        products = json.load(f)
    product = next((row for row in products if row["id"] == id), None)
    return product
