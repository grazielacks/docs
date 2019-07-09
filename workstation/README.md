# Configuração de Ambiente de Trabalho

## Dependências

Ubuntu

```sh
sudo apt install zsh git curl git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev libgdbm-dev libncurses5-dev automake libtool bison libffi-dev software-properties-common libmysqlclient-dev
```

## Outros

- [Terminal](Terminal.md)
- [Editor de Texto](Editor.md)
- [Docker + Docker Compose](Docker.md)






### OS

[brew.sh](http://brew.sh/)

```sh
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install git && brew install bash-completion
```

### 

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

## PHP + Apache

### OS

```sh
$ brew tap homebrew/dupes
$ brew tap homebrew/versions
$ brew tap homebrew/homebrew-php
$ brew tap homebrew/apache
$ brew update
$ brew install httpd24 --with-privileged-ports --with-http2
$ brew services start homebrew/apache/httpd24
$ mkdir ~/Projetos/php/www
$ subl /usr/local/etc/apache2/2.4/httpd.conf

DocumentRoot /Users/elton/Projetos/php/www
<Directory /Users/elton/Projetos/php/www>
AllowOverride All

Descomente o modulo mod_rewrite.so
LoadModule rewrite_module libexec/mod_rewrite.so

Coloque seu usuário
User elton
Group staff

ServerName localhost:80

$ cd ~/Projetos/php/www
$ echo "<h1>My User Web Root</h1>" > index.html
$ sudo apachectl -k restart
$ brew install php70 --with-httpd24
$ brew services start homebrew/php/php70
$ subl /usr/local/etc/apache2/2.4/httpd.conf

LoadModule php7_module /usr/local/opt/php70/libexec/apache2/libphp7.so

<IfModule dir_module>
    DirectoryIndex index.php index.html
</IfModule>

<FilesMatch \.php$>
    SetHandler application/x-httpd-php
</FilesMatch>

$ cd ~/Projetos/php/www
$ echo "<?php phpinfo();" > info.php
$ sudo apachectl -k restart
```

### Ubuntu

```sh
$ sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
$ sudo apt-get update
$ sudo apt-get install php7.0 php7.0-mysql php7.0-pgsql
```

First, make sure you have the following package installed so you can add repositories:

apt-get install software-properties-common
Next, add the PHP repository from Ondřej:

add-apt-repository ppa:ondrej/php
And finally, update your package list:

apt-get update
Install PHP 7.3
After you’ve added the repository, you can install PHP 7.3 with the following command:

apt-get install php7.3 php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml

## Composer

[composer](https://getcomposer.org/download/)

```sh
$ php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
$ php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
$ php composer-setup.php
$ php -r "unlink('composer-setup.php');"
$ mv composer.phar /usr/local/bin/composer
```

## Banco de Dados

### Mysql

#### OS

```sh
$ brew install mysql
$ brew services start mysql
$ mysql -u root
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
$ brew services start postgresql
$ createdb `whoami`
$ psql
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

[Settings](sublime_text.txt)

#### Pacotes
Package Control - ctrl+shift+p (Win, Linux) ou cmd+shift+p (OS X). Install Package.

* **SideBarEnhancements:**  O sidebar do Sublime é simples, com este pacote você libera uma infinidade de opções como: abrir, apagar, renomear, copiar, colar, procurar em arquivo, move, atualizar, etc.
* **OpenFolder:** Este pacote adiciona a possibildade de abrir uma pasta a partir do sidebar, você dá com o botão direito em cima da pasta escolhe Open  Folder e a pasta é aberta.
* **HTML5:** Suporte ao HTML5.
* **HTMLAttibutes:** Suporte para os atributos em HTML para completar de maneira automática.
* **BracketHighlighter:** Este é para destacar a abertura e fechamento de tags, chaves, parênteses, etc.
* **ColorPicker:** Este é bem legal, abre uma paleta de cores. No linux e windows para utilizar pressione ctrl+shift+c no MacOS cmd+shift+c.
* **jslint:** Controle de qualidade de código para o javascript.
* **DetectSyntax:** Detecta a sintaxe de arquivos como Gemfile, Capfile, etc. Também detecta arquivos do RSpec.
* **ColorHighlighter:** Ele inspeciona os valores de cores hexadecimais selecionados.
* **Sass:** Suporte ao Sass.
* **CSS3:** Esse plugin serve para manter uma boa organização no CSS.
* **JavaScriptNext:** Este é um pacote de sintaxe melhorada para JavaScript. Inclui novos recursos de ECMAScript 6.
* **PHPCS:** Mantem o padrão no código PHP.
* **Aligntab:** Ajuda a organizar os códigos, mantendo a padronização na identação.
* **FileDiffs:** Mostra as diferenças entre arquivos.

## Git

```sh
git config --global user.name "Elton Luis Kolling"
git config --global user.email "eltonlk@gmail.com"
git config --global color.ui true
git config --global color.status auto
git config --global color.branch auto
git config --global color.interactive auto
git config --global color.diff auto
git config --global color.grep auto
git config --global core.editor subl  // "mate -w"
git config --global core.pager ''
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage 'reset --hard HEAD~1'
git config --global alias.last 'log -1 HEAD'
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
git config --global alias.type 'cat-file -t'
git config --global alias.dump 'cat-file -p'
git config --global push.default simple
```

[gitignore](gitignore.txt)

## SSH

```sh
$ ssh-keygen -t rsa -C "YOUR@EMAIL.com"
$ cat ~/.ssh/id_rsa.pub
```

Copie a chave gerada e coloque onde for usar, [github](http://github.com/), [bitbucket](http://bitbucket.com/), etc.

## Redis

### OS

```sh
$ brew install redis
$ brew services start redis
```

## Arquivos

[bash_profile](bash_profile.txt)

## Outros

