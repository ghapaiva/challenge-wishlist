NETWORK = $(if $(ENV_NETWORK),$(ENV_NETWORK),dev_network)
POSTGRES_USER	 = $(if $(ENV_POSTGRES_USER),$(ENV_POSTGRES_USER),root)
POSTGRES_PASSWORD = $(if $(ENV_POSTGRES_PASSWORD),$(ENV_POSTGRES_PASSWORD),root)
POSTGRES_DOCKER_VOLUME	 = $(if $(ENV_POSTGRES_DOCKER_VOLUME),$(ENV_POSTGRES_DOCKER_VOLUME),./volumes)

run:
	docker network inspect ${NETWORK} >/dev/null 2>&1 || docker network create ${NETWORK}
	docker build -t api_wishlist -f docker/Dockerfile . && \
		docker run --rm -p 8000:8000 \
		--name api_wishlist \
		--env-file ./.env \
		--network ${NETWORK} \
		-v ./:/home/app \
		api_wishlist


run_postgres:
	docker network inspect ${NETWORK} >/dev/null 2>&1 || docker network create ${NETWORK}
	docker run --rm -p 5432:5432 \
		--name postgres_wishlist \
		--hostname postgres_wishlist \
		-e "POSTGRES_USER=${POSTGRES_USER}" \
		-e "POSTGRES_PASSWORD=${POSTGRES_PASSWORD}" \
		-v ./volumes/postgres_wishlist:/var/lib/postgresql/data \
		-v ./database/init.sql:/docker-entrypoint-initdb.d/init.sql \
		--network ${NETWORK} \
		postgres:15

run_keycloak:
	docker network inspect ${NETWORK} >/dev/null 2>&1 || docker network create ${NETWORK}
	docker run --rm \
		--name wishlist_keycloak \
		--network ${NETWORK} \
		-p 8080:8080 \
		-e KEYCLOAK_ADMIN=admin \
		-e KEYCLOAK_ADMIN_PASSWORD=admin \
		-e KC_DB=postgres \
		-e KC_DB_URL_HOST=postgres_wishlist \
		-e KC_DB_URL_DATABASE=wishlist_keycloak_db \
		-e KC_DB_USERNAME=${POSTGRES_USER} \
		-e KC_DB_PASSWORD=${POSTGRES_PASSWORD} \
		quay.io/keycloak/keycloak:26.3.2 \
		start-dev
