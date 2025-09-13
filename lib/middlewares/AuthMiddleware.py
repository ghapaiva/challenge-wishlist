from fastapi import Depends, HTTPException, Request, Security

from lib.core.config import settings
from lib.entities.user.schema import UserBase
from lib.security.keycloak.IdentityProvider import IdentityProvider
from lib.security.token import check_token_signature
from lib.utils.log import logger


class AuthMiddleware:
    '''
    Verify requests authorization jwt or api key
    '''

    def __init__(self):
        pass

    async def __call__(
            self,
            request: Request,
            _=Security(IdentityProvider.oauth2_scheme)
    ):
        try:
            token = await IdentityProvider.oauth2_scheme(request)
            token = check_token_signature(token)

            client_roles = []
            try:
                keycloak_client_id = settings.KEYCLOAK_CLIENT_ID
                client_roles = token["resource_access"][keycloak_client_id]["roles"]
            except Exception as e:
                logger.error(e)
                pass

            current_user: UserBase = UserBase(
                id=token.get("sub"),
                first_name=token.get("given_name", "preferred_username"),
                last_name=token.get("family_name", None),
                username=token["preferred_username"],
                email=token.get("email", None),
                roles=client_roles
            )
            return current_user
        except Exception as e:
            logger.error(e)
            raise HTTPException(401, 'Token verification failure')
