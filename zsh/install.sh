source "$DOT/helpers.sh"
source "$DOT/colors.sh"

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
