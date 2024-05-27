source "$(pwd)/helpers.sh"
source "$(pwd)/colors.sh"

# Set environment variable for the working directory.
# This makes one able to call $WD in all configurations, and get the path to the .dotfiles directory.
export WD
WD=$(pwd)

source "$DOT/greeter.sh"

# Neovim setup
if boolask "would you like to setup neovim?"; then
  source "$DOT/nvim/install.sh"
  echo -e "\n---\n"
fi

# ZSH setup
if boolask "would you like to setup zsh?"; then
  source "$DOT/zsh/install.sh"
  echo -e "\n---\n"
fi

# Kitty setup
if boolask "would you like to setup kitty terminal emulator?"; then
  source "$DOT/kitty/install.sh"
  echo -e "\n---\n"
fi

# Git setup
if boolask "would you like to setup git?"; then
  source "$DOT/git/install.sh"
  echo -e "\n---\n"
fi

# TMUX setup
if boolask "would you like to setup tmux?"; then
  source "$DOT/tmux/install.sh"
  echo -e "\n---\n"
fi

echo -e "${GREEN}completed set up all dotfiles. exiting...${NC}"
