alias cls='clear'
alias dlna='pulseaudio-dlna >/dev/null 2>&1 &'
alias pacman='sudo pacman'
alias pacsize="pacman -Qi | egrep '^(Name|Installed)' | cut -f2 -d':' | paste - - | column -t | sort -nrk 2 | grep MiB | less"
alias fix-keys="gpg --refresh-keys"

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
