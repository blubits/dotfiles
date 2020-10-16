####################
# oh-my-zsh settings
####################

ZSH=/usr/share/oh-my-zsh/

# Theme
ZSH_THEME="typewritten/typewritten"
TYPEWRITTEN_SYMBOL="$"

# Disable auto update checks
DISABLE_AUTO_UPDATE="true"

# Command autocorrection
ENABLE_CORRECTION="true"

# Display dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

#Time stamp in history file
HIST_STAMPS="yyyy-mm-dd"

# Plugins
plugins=(git)

####################
# Environment variables
####################

export PATH=~/.bin:~/.local/bin:$PATH
export SSH_ASKPASS=ssh_askpass

####################
# Aliases
####################

# Integrate pacman and yay, make the yay command AUR-only
alias pac='/usr/bin/pacman'
alias pacman='/usr/bin/yay'
alias yay='/usr/bin/yay --aur'
alias cat='bat'

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

npm set prefix ~/.npm
PATH+="$HOME/.npm/bin"

# opam configuration
test -r /home/blubits/.opam/opam-init/init.zsh && . /home/blubits/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Set typewritten ZSH as a prompt
fpath+=$HOME/.zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten
