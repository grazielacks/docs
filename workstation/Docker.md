# Docker + docker-compose

## Instalação

Como instalar [Docker](https://docs.docker.com/install/):

    curl -fsSL get.docker.com -o get-docker.sh
    bash get-docker.sh
    sudo usermod -aG docker YOUR_USER_NAME
    docker --version

Como instalar [docker-compose](https://docs.docker.com/compose/install/):

_Substituir **LAST.VERSION.NUMBER** pela ultima versão que tiver no site._
    
    sudo curl -L "https://github.com/docker/compose/releases/download/LAST.VERSION.NUMBER/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version


## Comandos

Criar container através da imagem padrão do ubuntu:

    docker run -t -i ubuntu /bin/bash

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


### Rails + Docker

Crie seu projeto Rails rodando:

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
    
