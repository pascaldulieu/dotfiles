#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \w]\$ '

# bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# allow tapping
synclient TapButton1=1 TapButton2=3 TapButton3=2

# set UK layout for keyboard
setxkbmap gb

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac


