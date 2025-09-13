import requests
from time import sleep

from lib.core.config import settings

if __name__ in ['__main__', "wsgi"]:
    # Wait for Keycloak to be up
    _max_tries = 5
    for tries in range(1, _max_tries + 1):
        try:
            requests.get(settings.KEYCLOAK_BASE_URL)
            break
        except requests.exceptions.ConnectionError:
            print(f"Waiting for Keycloak to be up.. ({tries}/{_max_tries})")
            sleep(5)
    else:
        print("Unable to connect to Keycloak. Exiting...")
        exit(1)

    from lib.app import create_app

    app = create_app()
