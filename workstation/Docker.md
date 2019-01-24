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

Exibir os containers que estão em execução:

    docker ps

Parar um container:

    docker stop id_do_seu_container
    
Exibir todos containers que estão em execução e parados:

    docker ps -a

Iniciar um container:

    docker start id_do_seu_container

Apagar container (se você não for usar seu container é uma boa prática que você apague ele para liberar memória):
    
    docker rm id_do_seu_container
    
