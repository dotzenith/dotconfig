# Sourcing functions
source "$ZDOTDIR/functions"
zsh_add_file "exports"

# Setting some options for quality-of-life improvements
zle_highlight=('paste:none')
DISABLE_AUTO_TITLE="true"
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
KEYTIMEOUT=1
setopt appendhistory
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
unsetopt BEEP

# Completions
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
fpath=( ~/.zfunc "${fpath[@]}" )
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

# vim mode
bindkey -v
bindkey "^?" backward-delete-char
bindkey -M vicmd '^[' undefined-key
bindkey -rM viins '^X'

eval "$(fzf --zsh)"
eval "$(mise activate zsh)"
eval "$(atuin init zsh --disable-up-arrow)"

# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || \
{
  eval "$(starship init zsh)"
}

# motd
[ -f .zshenv ] && lovesay 

# Spotify
zsh_add_file "rspotify"
