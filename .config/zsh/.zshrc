# Just the normal path stuff
PATH=/opt/local/bin:/opt/local/sbin:$PATH
PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$PATH:$HOME/.scripts
export PATH

# For the starship config
export STARSHIP_CONFIG=~/.config/starship/config.toml

# Setting some options for quality-of-life improvements
zle_highlight=('paste:none')
DISABLE_AUTO_TITLE="true"
setopt appendhistory
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
unsetopt BEEP

# Completions
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
autoload -U compinit && compinit

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

# Sourcing plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

# Sourcing aliases 
zsh_add_file "zsh-aliases"

# removing underlines from zsh-syntax-highlighting 
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Zoxide
eval "$(zoxide init zsh)"

# motd
zsh_add_file "zsh-lovesay"

# Different prompts for starship depending on tmux session or not
if ! [ -z "${TMUX}" ]; then
  export STARSHIP_CONFIG=~/.config/starship/tmux_config.toml
fi

# Starship
eval "$(starship init zsh)"
