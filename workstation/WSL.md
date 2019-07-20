# Windwos + WSL
Em "Ativar e Remover Recusos" deve ativar as opções:

- Hyper-V 
- Subsistema do Windows para Linux (Microsoft Subsystem for Linux)
- Plataforma de Máquina Virtual (Virtual Machine Platform)

Em seguida deve instalar o Ubuntu e o Windows Terminal no Microsof Store .

Instalar Fontes Powerline no Windows, abra o power shell como administrador.

```sh
Set-ExecutionPolicy Bypass
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.ps1
cd ..
rm -r -fo fonts
Set-ExecutionPolicy Default
```

Definir nas configurações do windows ternimal para usuar a fonte "Roboto Mono for Powerline".
