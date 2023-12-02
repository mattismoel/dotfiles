if status is-interactive
    # Commands to run in interactive sessions can go here
end


# DEFAULTS ========================================================================
set -gx EDITOR nvim # Set default editor for fish


# Default greeting message
function fish_greeting
    set greeting "👋 Welcome Back on $(uname)!"
    if command -q cowsay
        echo $greeting | cowsay -f small 
    end
end

set -gx PATH $PATH /usr/local/go/bin
set -x GOPATH (go env GOPATH)
set -x PATH $PATH (go env GOPATH)/bin
