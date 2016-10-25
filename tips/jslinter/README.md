# Analisando seu código JS com um linter

[ESlint](http://eslint.org/)

## Instalação

```sh
## para poder fazer lint de ES6 e JSX
$ npm install -g eslint
$ npm install -g babel-eslint
```

## Configuração

Após instalado o eslint, vá até o diretório do seu projeto, digite eslint --init e responda as perguntas de acordo com sua necessidade.

```sh
$ cd pasta_do_projeto
$ eslint --init
```

Após isso, será criado um arquivo chamado .eslintrc dentro da pasta raiz do seu projeto.

Se você quiser entender tudo que ele escreveu ali, dá uma olhadinha na [documentação](http://eslint.org/docs/user-guide/configuring) é super detalhada e bem explicada.

Tendo já o arquivo, basta você rodar no terminal em cima do arquivo desejado e ele fará o report se algum erro acontecer.

```sh
$ eslint nome_do_arquivo_desejado.js
```

## Integrando o eslint no Sublime

Com o Package Control instalado, instale os seguintes packages:

* SublimeLinter
* SublimeLinter-contrib-eslint

Feito isso, reinicie o seu Sublime e comece a escrever seu código JS!

Quando tiver algum erro, ele irá te notificar com marcadores ao lado do erro e na parte inferior irá te avisar o erro.

Se você quiser ver todos os erros numa lista e poder navegar entre eles, aperte cmd + shift + p ou ctrl + shift + p e digite linter show.
