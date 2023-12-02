# Determine which OS fish is running on and set aliases accordningly
switch (uname)
    case "Linux"
        echo "On Linux"
        set fish_path "~/dotfiles/fish/"
        set nvim_path "~/dotfiles/nvim/"
        set kitty_path "~/dotfiles/kitty/"
        set albumcut_path "~/Documents/Programmering/Projekter/albumcut/bin/albumcut-linux"
    case "Darwin"
        echo "On MacOS"
        set fish_path "~/dotfiles/fish/"
        set nvim_path "~/dotfiles/nvim/"
        set kitty_path "~/dotfiles/kitty/"
        set albumcut_path "~/Users/mattiskristensen/Documents/Programmering/Projekter/albumcut/bin/albumcut-darwin-arm"
    case "Windows"
        echo "On Windows"
    case "*"
        echo "Could not determine OS..."
end

alias kconf="nvim $kitty_path"        # Open Kitty Terminal configuration
alias nconf="nvim $nvim_path"        # Open Neovim configuration
alias fconf="nvim $fish_path"         # Open Fish configuration
alias albumcut="$albumcut_path"
