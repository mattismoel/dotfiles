source "$DOT/helpers.sh"
source "$DOT/colors.sh"

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
