# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#-------------------
# Prompt
#-------------------

export PS1="\[\033[38;5;12m\]>>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

#-------------------
# Environment variables
#-------------------

PATH=~/.bin:~/.bin/warnai:~/.local/bin:$PATH
QT_QPA_PLATFORM=wayland-egl
QT_WAYLAND_FORCE_DPI=physical

#-------------------
# Aliases
#-------------------

# Enable color
alias todoist='todoist --color'
alias ls='ls --color=auto'

# Integrate pacman and yay, make the yay command AUR-only
alias pac='/usr/bin/pacman'
alias pacman='/usr/bin/yay'
alias yay='/usr/bin/yay --aur'

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

eval $(keychain --eval --quiet id_rsa)
