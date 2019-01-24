# Terminal

## Instalar o [Zsh](https://ohmyz.sh/): 

    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    
## Instalar o tema [Spaceship ZSH](https://denysdovhan.com/spaceship-prompt/): 

    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    
Definir no arquivo .zshrc
    
    ZSH_THEME="spaceship"
    
## Instalar o plugin [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions):

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    
Definir no ~/.zshrc

    plugins=(... zsh-autosuggestions)

## Instalar o plugin [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting):
    
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    
Definir no ~/.zshrc
    
    plugins=(... zsh-syntax-highlighting)
