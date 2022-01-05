# Just the normal path stuff
PATH=/opt/local/bin:/opt/local/sbin:$PATH
PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$PATH:$HOME/.bin
PATH=$PATH:$HOME/.scripts
PATH=$PATH:$HOME/Library/Python/3.9/bin
export PATH

# Setting some options for quality-of-life improvements
zle_highlight=('paste:none')
DISABLE_AUTO_TITLE="true"
setopt appendhistory
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
unsetopt BEEP

# Completions
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
_comp_options+=(globdots)
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# User configuration
bindkey -s '^c' 'clear ^M'

# Defaults
export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='brave'

# Sourcing functions
source "$ZDOTDIR/zsh-functions"

# Sourcing aliases 
zsh_add_file "zsh-aliases"

# Sourcing plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

# removing underlines from zsh-syntax-highlighting 
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Zoxide
eval "$(zoxide init zsh)"

# lovesay 
python3 git_folders/lovesay/lovesay.py

# Starship
eval "$(starship init zsh)"
