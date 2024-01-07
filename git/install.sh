source "$DOT/helpers.sh"
source "$DOT/colors.sh"

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
