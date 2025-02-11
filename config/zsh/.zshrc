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

# Sourcing plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "jeffreytse/zsh-vi-mode"

# Sourcing aliases and other things
zsh_add_file "aliases"
zsh_add_file "secrets"
zsh_add_file "rspotify"

# removing underlines from zsh-syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Vim stuff
# https://github.com/starship/starship/issues/3418
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi
bindkey -v '^?' backward-delete-char
ZVM_CURSOR_STYLE_ENABLED=false
# End Vim stuff

# So zsh-vi-mode doesn't clobber other keymaps
function init_shell_addons() {
    eval "$(fzf --zsh)"
    eval "$(mise activate zsh)"
    eval "$(atuin init zsh --disable-up-arrow)"
    eval "$(starship init zsh)"
}
zvm_after_init_commands+=(init_shell_addons)

# motd
[ -f .zshenv ] && LOVESAY_COLORSCHEME="catppuccin mocha" lovesay
