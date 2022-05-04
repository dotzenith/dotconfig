# Sourcing functions
source "$ZDOTDIR/zsh-functions"
zsh_add_file "zsh-exports"

# Setting some options for quality-of-life improvements
zle_highlight=('paste:none')
DISABLE_AUTO_TITLE="true"
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
unsetopt BEEP

# Completions
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
autoload -U compinit && compinit

# Colors
autoload -Uz colors && colors

# User configuration
bindkey -s '^c' 'clear ^M'

# Sourcing plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

# Sourcing aliases 
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-secrets"

# removing underlines from zsh-syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# vim mode
bindkey -v

# motd
zsh_add_file "zsh-lovesay"

# Spotify
zsh_add_file "zsh-spotify"

# Starship
eval "$(starship init zsh)"
