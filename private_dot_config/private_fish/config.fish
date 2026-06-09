if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -g fish_greeting

alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias cd='z'
alias cat='bat'
alias hx='helix'

zoxide init fish | source

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function cpr -w rsync -d 'rsync wrapper for comfort copy'
    command rsync -avhP $argv
end

# Created by `pipx` on 2026-05-28 16:46:00
set PATH $PATH /home/wheels/.local/bin
