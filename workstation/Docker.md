# Docker + docker-compose

## Instalação

Como instalar [Docker](https://docs.docker.com/install/):

```sh
curl -fsSL get.docker.com -o get-docker.sh
bash get-docker.sh
sudo usermod -aG docker YOUR_USER_NAME # Para executar o Comando Docker sem Sudo 
sudo service docker start
docker --version
sudo docker run hello-world
```

Como instalar [docker-compose](https://docs.docker.com/compose/install/):

_Substituir **LAST.VERSION.NUMBER** pela ultima versão que tiver no site._

```sh
sudo curl -L "https://github.com/docker/compose/releases/download/LAST.VERSION.NUMBER/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

## Comandos

Criar container através da imagem padrão do ubuntu:

```sh
docker run -t -i ubuntu /bin/bash
```

Exibir os containers que estão em execução:

    docker ps

Exibir todos containers que estão em execução e parados:

    docker ps -a

Iniciar um container:

    docker start id_do_seu_container

Ir para o bash do container:

    docker exec -it id_do_seu_container bash

Parar um container:

    docker stop id_do_seu_container

Apagar container (se você não for usar seu container é uma boa prática que você apague ele para liberar memória):
    
    docker rm id_do_seu_container

Listar imagens

    docker image ls


### Rails + Docker

Crie seu projeto Rails:

    docker run -it --rm --user "$(id -u):$(id -g)" -v "$PWD":/usr/src/app -w /usr/src/app rails rails new --skip-bundle nome_do_app

_Vai utilizar uma imagem rails para criar o container_

_Local onde o app vai ficar no container: /usr/src/app_

_Evitar criar os arquivos como root: --user "$(id -u):$(id -g)"_

Agora que criamos nosso Dockerfile podemos fazer o Build da nossa imagem (Construir nossa imagem personalizada), dentro da pasta do seu projeto rode:

    docker build -t nome_do_app .

Para criar o banco de dados:

    docker run -v "$PWD":/usr/src/app nome_do_app rails db:create
    
Para gerar um scaffold simples:

    docker run -v "$PWD":/usr/src/app nome_do_app rails g scaffold notice title:text body:text
    
Para rodar as migrations:

    docker run -v "$PWD":/usr/src/app nome_do_app rails db:migrate
    
Depois disso podemos pegar a imagem que geramos e criar nosso container para subir nossa aplicação:
    
    docker run -v "$PWD":/usr/src/app -t -p 3000:3000 nome_do_app
    
Pronto \o/, agora acesse no seu Browser http://localhost:3000/notices.


### Rails + docker-compose

Crie seu projeto Rails:

    docker run -it --rm --user "$(id -u):$(id -g)" -v "$PWD":/usr/src/app -w /usr/src/app rails rails new --skip-bundle nome_do_app --database=postgresql
    
Agora entre no diretório via console e crie um file chama “Dockerfile” e substitua o conteúdo dele por:

    FROM ruby:2.3-slim
    # Instala as nossas dependencias
    RUN apt-get update && apt-get install -qq -y --no-install-recommends \
          build-essential nodejs libpq-dev
    # Seta nosso path
    ENV INSTALL_PATH /usr/src/app
    # Cria nosso diretório
    RUN mkdir -p $INSTALL_PATH
    # Seta o nosso path como o diretório principal
    WORKDIR $INSTALL_PATH
    # Copia o nosso Gemfile para dentro do container
    COPY Gemfile ./
    # Instala as Gems
    RUN bundle install
    # Copia nosso código para dentro do container
    COPY . .
    # Roda nosso servidor
    CMD puma -C config/puma.rb
    
Crie um arquivo chamado “docker-compose.yml” e coloque nele:

    version: '2'

    services:
      db:
        image: 'postgres:9.5'
        volumes:
          - 'postgres:/var/lib/postgresql/data'

      app:
        depends_on:
          - 'db'
        build: .
        ports:
          - '3000:3000'
        volumes:
          - '.:/usr/src/app'

    volumes:
      postgres:
      
Para fazer o Build de todos os nossos containers basta rodar (dentro do projeto):

    docker-compose build
    
Atualize seu arquivo config/database.yml colocando nele:

    default: &default
      adapter: postgresql
      encoding: unicode
      pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
      host: db
      user: postgres

    development:
      <<: *default
      database: db_development

    test:
      <<: *default
      database: db_test

    production:
      <<: *default
      database: db_production
      
Para criar o banco de dados dentro do PostgreSQL rode:

    docker-compose run --rm app rake db:create
    
Gere o seguinte scaffold notice:

    docker-compose run --rm app rails g scaffold notice title:string body:text
    
Rode as migrations:

    docker-compose run --rm app rake db:migrate
    
Para subir nossos containers, rode no console:

    docker-compose up
    
Pronto \o/, agora acesse no seu Browser http://localhost:3000

Você pode derrubar tudo, removendo os containers completamente, com o comando para baixo:

    docker-compose down --volumes

