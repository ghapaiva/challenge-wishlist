from keycloak import KeycloakOpenID
from fastapi.security import OAuth2PasswordBearer


from lib.core.config import settings


class IdentityProvider:
    open_id = KeycloakOpenID(
        server_url=settings.KEYCLOAK_BASE_URL,
        client_id=settings.KEYCLOAK_CLIENT_ID,
        realm_name=settings.KEYCLOAK_REALM,
        client_secret_key=settings.KEYCLOAK_CLIENT_SECRET
    )

    KEYCLOAK_PUBLIC_KEY = "-----BEGIN PUBLIC KEY-----\n" + \
        open_id.public_key() + "\n-----END PUBLIC KEY-----"

    oauth2_scheme = OAuth2PasswordBearer(
        tokenUrl=f"{settings.KEYCLOAK_PUBLIC_BASE_URL}/realms/{settings.KEYCLOAK_REALM}/protocol/openid-connect/token"
    )
