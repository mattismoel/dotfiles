if status is-interactive
    # Commands to run in interactive sessions can go here
end


# DEFAULTS ========================================================================
set -gx EDITOR nvim # Set default editor for fish


# Default greeting message
function fish_greeting
    fortune | cowsay -p 
end


# ALIASES =========================================================================
alias nconf="nvim ~/.config/nvim/"              # Open Neovim configuration
alias fconf="nvim ~/.config/fish/config.fish"   # Open Fish configuration
alias kconf="nvim ~/.config/kitty/kitty.conf"   # Open Kitty Terminal configuration

alias air="/home/mattiskristensen/go/bin/air"   # Create GOLANG air command


# ENVIRONMENT VARIABLES ===========================================================
# GO 
set -x GOPATH (go env GOPATH)
set -x PATH $PATH (go env GOPATH)/bin
set -gx PATH "$HOME/.cargo/bin" $PATH
