# challenge-wishlist
Este repositório contém uma API que possibilita a criação de novos clientes, e o objetivo principal da mesma é salvar os produtos favoritos para cada cliente. Também é possível acessar produtos de um parceiro externo (dados estão mockados) para consulta.

Para a API rodar perfeitamente, é necessário que exista uma instãncia de um servidor Postgres e uma instância do Keycloak, mas não se preocupe, utilizando o Docker conseguiremos iniciar ambos. Existe um arquivo de init.sql, ele irá criar os dois bancos de dados (um da API e um do Keycloak) e irá adicionar os dados iniciais do Keycloak.
Obs: Para o Keycloak funcionar corretamente integrando com uma API, é necessário a criação de um client com credenciais, esse arquivo irá criar tudo que essa API precisa pra ser executada corretamente.
Obs 2: A API necessita de autenticação para todos os endpoints. Eu deixei criado, no backup, um usuário chamado john.doe com a senha passw. Se necessário, é possível criar um usuário diretamente pelo Keycloak, apenas lembre-se de criar o usuário dentro do realm 'wishlist". Criando-o no realm "master", a autenticação irá falhar.

## Executando
Este arquivo irá conter as informações de como executar a API e suas dependências.
O Docker é obrigatório ter instalado na máquina.

### Makefile
Utilizando sistemas Unix (pode ser que dê problema no Windows), este repositório dá a possibilidade de executar utilizando o Makefile.
Temos três comandos para executar, é importante seguir a ordem, pois existem dependências. Será necessário ter 3 terminais executando.
Segue os comandos:
```bash
make run_postgres
```
Este comando irá iniciar uma instância do Postgres em seu Docker.

```bash
make run_keycloak
```
Tenha certeza que o banco de dados está "ready to accept connections" antes de rodar esse comando. O Keycloak precisa se conectar em um banco de dados.
Após o Keycloak executar, será possível acessá-lo pela url http://localhost:8080. O usuário e senha são "admin", "admin", respectivamente.

```bash
make run
```
Enfim, para executar a API, basta executar o comando acima. Ela estará escutando a porta 8000, logo o Swagger estará acessível em http://localhost:8000/docs.


### Docker compose
Também é possível executar utilizando o docker compose, para caso não tenha instalado o Makefile, ou se apenas preferir utilizar o compose.
Apenas rode o comando a seguir e todos os 3 serviços serão executados em ordem.
```bash
docker compose up
```
Após o Keycloak executar, será possível acessá-lo pela url http://localhost:8080. O usuário e senha são "admin", "admin", respectivamente.
A API estará escutando a porta 8000, logo o Swagger estará acessível em http://localhost:8000/docs.

### Kubernetes
É possível executar via Kubernetes também. Para isso, é necessário estar conectado a um cluster Kubernetes.
É necessário também ter instalado o Helm e o Kubectl.

Para executar utilizando helm chart, primeiro, precisaremos buildar a imagem da api com o comando:
```bash
docker build -t api_wishlist -f docker/Dockerfile .
```

Após isso, execute o comando de instalação dos charts:
```bash
helm install wishlist ./wishlist-chart --namespace wishlist --create-namespace
```

Caso queira remover o chart, rode:
```bash
helm uninstall wishlist 
```

Para ser possível acessar as portas que estão dentro do Kubernetes, vamos usar o port forward do kubectl para os serviços do Keycloak e da API:
```bash
kubectl port-forward svc/wishlist-keycloak 8080:8080
kubectl port-forward svc/wishlist-api 8000:8000
```
Com isso, o Keycloak e a API estarão disponíveis nas portas 8080 e 8000 respectivamente.
O usuário e senha do Keycloak são "admin", "admin", respectivamente.

## Testando
Na API, teremos o CRUD de clientes, e mais três endpoints para manipulação da lista de favoritos. Um para consultar (por cliente), um para adicionar e outro para remover. Temos também um endpoint para buscar os produtos que estão mockados em products.json, na raiz do repositório.

É necessário a autenticação, então como citado acima, utilizando o usuário e senha john.doe e passw. Como utilizamos o Keycloak como autentiacdor OAuth2, é necessário passar também o client_id e o client_secret. Provavelmente, já estará preenchido, caso contrário, os valores estão no .env nas variáveis KEYCLOAK_CLIENT_ID e KEYCLOAK_CLIENT_SECRET.
Obs: Sempre que você cria um client no Keycloak, o secret dele é criado aleatoriamente. Como fizemos um backup, o secret sempre será o mesmo.

Após efetuar o login, os requests dentro do Swagger funcionarão. Caso o login não tenha sido feito, será retornado um 401.

### Conclusões
Muito obrigado pela oportunidade, estou a disposição para qualquer dúvida em g.hapaiva@gmail.com
