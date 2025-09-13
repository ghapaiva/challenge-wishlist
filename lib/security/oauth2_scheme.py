from fastapi.openapi.models import OAuthFlows as OAuthFlowsModel, OAuthFlowClientCredentials
from fastapi.security import OAuth2


class OAuth2ClientCredentialsBearer(OAuth2):
    def __init__(
        self,
        tokenUrl: str,
        scopes: dict = None,
        scheme_name: str = None,
        auto_error: bool = True,
    ):
        flows = OAuthFlowsModel(clientCredentials=OAuthFlowClientCredentials(tokenUrl=tokenUrl, scopes=scopes or {}))
        super().__init__(flows=flows, scheme_name=scheme_name, auto_error=auto_error)


oauth2_scheme = OAuth2ClientCredentialsBearer(
    tokenUrl="http://localhost:8080/realms/{REALM}/protocol/openid-connect/token"
)
