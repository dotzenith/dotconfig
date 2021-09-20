# Just the normal path stuff
PATH=/opt/local/bin:/opt/local/sbin:$PATH
PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$PATH:$HOME/.bin
PATH=$PATH:$HOME/.scripts
PATH=$PATH:$HOME/Library/Python/3.9/bin
PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/sharmadanshu/.oh-my-zsh"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# oh my zsh plugins
plugins=(git zsh-autosuggestions zsh-completions)
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

# Aliases
alias python='python3'
alias v='vim'
alias vim='nvim'
alias wisecow='fortune | cowsay'
alias mirrorscreen='scrcpy'
alias top='bpytop'
alias psp='ppsspp'
alias s='source ~/.config/zsh/.zshrc'
alias ra='source ranger'
alias al="vim ~/.config/alacritty/alacritty.yml"
alias skstop='brew services stop skhd'
alias skstart='brew services start skhd'

# ls Aliases
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'

# tmux aliases
alias tkm="tmux kill-session -t Main"
alias t="tmux new-session -A -s Main -n Fun -f ~/.config/tmux/.tmux.conf"
alias tnew='tmux new -s '
alias tkill='tmux kill-session -t '
alias tatt='tmux a -t '

# lovesay 
python3 git_folders/lovesay/lovesay.py

# Starship
eval "$(starship init zsh)"
