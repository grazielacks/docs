# Configuração de Ambiente de Trabalho

## Dependências

### OS

[brew.sh](http://brew.sh/)

```sh
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install git && brew install bash-completion
```

### Ubuntu

```sh
$ sudo apt-get update
$ sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev libgdbm-dev libncurses5-dev automake libtool bison libffi-dev python-software-properties software-properties-common
```

## RVM - Ruby

[rvm.io](https://rvm.io/)

```sh
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$ \curl -sSL https://get.rvm.io | bash -s stable
```

## NVM - Node

[creationix/nvm](https://github.com/creationix/nvm)

using curl:

```sh
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
```

or Wget:

```sh
$ wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
```

## PHP

### OS

```sh
$ brew tap homebrew/dupes
$ brew tap homebrew/versions
$ brew tap homebrew/homebrew-php
$ brew unlink php56
$ brew install php70
```

### Ubuntu

```sh
$ sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
$ sudo apt-get update
$ sudo apt-get install php7.0 php7.0-mysql php7.0-pgsql
```

## Banco de Dados

### Mysql

#### OS

```sh
$ brew install mysql
$ ln -sfv /usr/local/opt/mysql/*plist ~/Library/LaunchAgents
$ launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
```

#### Ubuntu

```sh
$ sudo apt-get install mysql-server mysql-client libmysqlclient-dev
```

### PostgreSQL

#### OS

```sh
$ brew update
$ brew install postgres
$ ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
$ launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

#### Ubuntu

```sh
$ sudo apt-get update
$ sudo apt-get install postgresql postgresql-contrib libpq-dev
```

#### Configuração

O procedimento de instalação criou uma conta de usuário chamada **postgres** que está associado com o papel Postgres padrão. Para utilizar Postgres, vamos precisar entrar na conta. Será solicitado uma senha para o usuário.

```sh
$ sudo -i -u postgres
```

Para que seja mais simples gerenciar os bancos de dados de desenvolvimento, crie um usuário no PostgreSQL com o mesmo nome do seu usuário, no exemplo abaixo fnando.

```sh
$ sudo -u postgres createuser -rds fnando
```

Depois, crie um banco de dados com o mesmo nome de seu usuário.

```sh
$ createdb $USER
```

## Programas

### OS

[pgAdmin](https://www.pgadmin.org/)
[sequelPro](https://www.sequelpro.com/)
[slack](https://slack.com/)

### Ubuntu

[pgAdmin](https://www.pgadmin.org/)
[sequelPro](https://www.sequelpro.com/)
[slack](https://slack.com/)

## Editores

### Sublime Text

[www.sublimetext.com](https://www.sublimetext.com/)

#### OS
Para criar o comando para o terminal
```sh
$ ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
```

[Settings](sublime_text)

## Git

```sh
$ git config --global user.name "YOUR NAME"
$ git config --global user.email "YOUR@EMAIL.com"
$ git config --global color.ui true
$ git config --global color.status auto
$ git config --global color.branch auto
$ git config --global color.interactive auto
$ git config --global color.diff auto
$ git config --global color.grep auto
$ git config --global core.editor subl  // "mate -w"
$ git config --global alias.co checkout
$ git config --global alias.br branch
$ git config --global alias.ci commit
$ git config --global alias.st status
$ git config --global alias.unstage 'reset HEAD --'
$ git config --global alias.last 'log -1 HEAD'
$ git config --global alias.visual "!gitk"
$ git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
$ git config --global alias.type 'cat-file -t'
$ git config --global alias.dump 'cat-file -p'
$ git config --global push.default simple
```

[gitignore](gitignore)

## SSH

```sh
$ ssh-keygen -t rsa -C "YOUR@EMAIL.com"
$ cat ~/.ssh/id_rsa.pub
```

Copie a chave gerada e coloque onde for usar, [github](http://github.com/), [bitbucket](http://bitbucket.com/), etc.

## Arquivos

[bash_profile](bash_profile)

## Outros

[bash_git_completion](http://stackoverflow.com/questions/12399002/how-to-configure-git-bash-command-line-completion)
