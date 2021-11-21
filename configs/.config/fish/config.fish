set fish_greeting

# Force 256 color terminal (fixes wrong colors when ssh'ing)
set TERM xterm-256color

set -gx GOPATH ~/go
set -gx GOROOT /usr/local/go

set -gx NPM_PACKAGES ~/.npm-packages

set -gx PATH ~/.bin/ ~/.local/bin $NPM_PACKAGES/bin $GOROOT/bin $GOPATH/bin ~/.cargo/bin $PATH

function o
    xdg-open $argv
end

function scr
    screen -aAxR
end

function ixio
    curl -F 'f:1=<-' ix.io
end

function objdump
    /usr/bin/objdump -M intel $argv
end

if command -v exa > /dev/null
  abbr -a l 'exa'
  abbr -a ls 'exa'
  abbr -a ll 'exa -l'
  abbr -a lll 'exa -la'
else
  abbr -a l 'ls'
  abbr -a ll 'ls -l'
  abbr -a lll 'ls -la'
end

if command -v nvim > /dev/null
  abbr -a vim 'nvim'
end

if command -v starship > /dev/null
  starship init fish | source
end

