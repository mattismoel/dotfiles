source "$DOT/helpers.sh"
source "$DOT/colors.sh"

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
