# Terminal

Instalar o [Zsh](https://ohmyz.sh/): 

    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    
Instalar o tema [Spaceship ZSH](https://denysdovhan.com/spaceship-prompt/): 

    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    
_Definir ZSH_THEME="spaceship" no arquivo .zshrc_

