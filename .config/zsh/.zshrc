# Just the normal path stuff
PATH=/opt/local/bin:/opt/local/sbin:$PATH
PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$PATH:$HOME/.bin
PATH=$PATH:$HOME/.scripts
PATH=$PATH:$HOME/Library/Python/3.9/bin
PATH="/usr/local/opt/util-linux/bin:$PATH"
PATH="/usr/local/opt/util-linux/sbin:$PATH"
export PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/sharmadanshu/.oh-my-zsh"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# oh my zsh plugins
plugins=(git zsh-autosuggestions zsh-completions vi-mode)
autoload -U compinit && compinit

# spaceship zsh theme
# ZSH_THEME="spaceship"

# Sourcing oh my zsh
source $ZSH/oh-my-zsh.sh

# User configuration
bindkey -s '^c' 'clear ^M'

# Defaults
export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='brave'

# lovesay 
python3 git_folders/lovesay/lovesay.py

# Source aliases
[ -f ~/.config/zsh/.aliases ] && source ~/.config/zsh/.aliases
alias ali="source ~/.config/zsh/.aliases"

# Starship
eval "$(starship init zsh)"
