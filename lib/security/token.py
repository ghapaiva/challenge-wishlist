from fastapi import HTTPException
from typing import Any

from lib.security.keycloak.IdentityProvider import IdentityProvider
from lib.utils.log import logger


def check_token_signature(token: Any) -> dict[str, Any]:
    """
    Method that confirms if the token is valid
    Args:
        The user token (token: Any)
    Returns:
        The token info (dict[str, Any])
    """
    options = {
        "verify_signature": True,
        "verify_aud": False,
        "verify_exp": True
    }

    try:
        token_info = IdentityProvider.open_id.decode_token(
            token,
            key=IdentityProvider.KEYCLOAK_PUBLIC_KEY,
            options=options
        )
        token_info['access_token'] = token

    except Exception as e:
        logger.error(e)
        raise HTTPException(401, 'Token verification failure')

    return token_info
