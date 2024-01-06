# Colors
export NC="\033[0m"
export RED="\033[0;31m"
export GREEN="\033[0;32m"
export BLUE="\033[0;34m"

# Ask user for confirmation of question $1.
boolask () {
  read -rp "$1 (Y/n): " answer
  if [[ $answer && $answer == [yY] ]]
  then
    return 0
  else
    return 1
  fi
}

symlinkexists () {
  if [ -L "$1" ]; then
    return 0
  fi
  return 1
}


# Set environment variable for the working directory.
# This makes one able to call $WD in all configurations, and get the path to the .dotfiles directory.
export WD
WD=$(pwd)

# Greeter.
echo -e "${BLUE}welcome to dotfiles setup!${NC}"
echo

# Neovim setup
if boolask "would you like to setup neovim?"; then
  # Check if nvim configuration already exists. If it does it moves the configuration to a backup path.
  # This makes sure that the user is able to set up the config smoothly.
  if [ -d "$HOME/.config/nvim" ]; then
    echo -e "${RED}warning:${NC} a neovim configuration already exists..."
    if boolask "would you like to override? a backup will be stored at ~/.config/.nvim.backup"; then
      cp -r "$HOME/.config/nvim" "$HOME/.config/.nvim.backup"
      rm -rf "$HOME/.config/nvim"
    fi
  fi

  # If a symlink already exists with a neovim configuration, remove it.
  if symlinkexists "$HOME/.config/nvim"; then
    rm "$HOME/.config/nvim"
  fi

  # Create symlink for neovim configuration from dotfiles directory.
  ln -s "$WD/nvim" "$HOME/.config/nvim"
  echo -e "${GREEN}completed set up of nvim${NC}"
fi


# ZSH setup
if boolask "would you like to setup zsh?"; then
  # Check if ZSH configuration already exists. If it does it moves the configuration to a backup path.
  # This makes sure that the user is able to set up the config smoothly.
  if [ -d "$HOME/.config/zsh" ]; then
    echo -e "${RED}warning:${NC} a zsh configuration already exists..."
    if boolask "would you like to override? A backup will be stored at ~/.config/.zsh.backup"; then
      cp -r "$HOME/.config/zsh" "$HOME/.config/.zsh.backup"
      rm -rf "$HOME/.config/zsh"
    fi
  fi

  if [ -f "$HOME/.zshrc" ]; then
    echo -e "${RED}warning:${NC} a .zshrc already exists..."
    if boolask "would you like to override? a backup will be stored at ~/.zshrc.backup"; then
      mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
    fi
  fi

  if symlinkexists "$HOME/.config/zsh"; then
    rm "$HOME/.config/zsh"
  fi

  # Create symlinks for zsh configuration files and .zshrc.
  ln -s "$WD/zsh" "$HOME/.config/zsh"
  ln -s "$WD/zsh/.zshrc" "$HOME/.zshrc"
  echo -e "${GREEN}completed set up of zsh${NC}"
fi

# Kitty setup
if boolask "would you like to setup kitty terminal emulator?"; then
  # Check if Kitty configuration already exists. If it does it moves the configuration to a backup path.
  # This makes sure that the user is able to set up the config smoothly.
  if [ -d "$HOME/.config/kitty" ]; then
    echo -e "${RED}warning:${NC} a kitty configuration already exists..."
    if boolask "would you like to override? A backup will be stored at ~/.config/.kitty.backup"; then
      cp -r "$HOME/.config/kitty" "$HOME/.config/.kitty.backup"
      rm -rf "$HOME/.config/kitty"
    fi
  fi

  if symlinkexists "$HOME/.config/kitty"; then
    rm "$HOME/.config/kitty"
  fi

  # Create symlinks for zsh configuration files and .zshrc.
  ln -s "$WD/kitty" "$HOME/.config/kitty"
  echo -e "${GREEN}completed set up of kitty${NC}"
fi

# Git setup
if boolask "would you like to setup git?"; then
  if [ -f "$HOME/.gitconfig" ]; then
    echo -e "${RED}warning:${NC} a .gitconfig file already exists..."
    if boolask "would you like to override?"; then
      rm "$HOME/.gitconfig"
    fi
  fi

  if symlinkexists "$HOME/.gitconfig"; then
    rm "$HOME/.gitconfig"
  fi

  ln -s "$WD/git/.gitconfig" "$HOME/.gitconfig"
  echo -e "${GREEN}completed set up of git${NC}"
fi

echo -e "${GREEN}completed set up all dotfiles. exiting...${NC}"
