# Sourcing functions
source "$ZDOTDIR/functions"
zsh_add_file "exports"

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
zsh_add_file "aliases"
zsh_add_file "secrets"

# removing underlines from zsh-syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# fzf
[ -f ~/.config/fzf/.fzf.zsh ] && source ~/.config/fzf/.fzf.zsh

# vim mode
bindkey -v
bindkey "^?" backward-delete-char

# motd
[ -f .zshenv ] && sleep 0.01 && lovesay

# Spotify
zsh_add_file "spotify"

# Zoxide
eval "$(zoxide init zsh)"

# Starship
eval "$(starship init zsh)"
