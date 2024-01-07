source "$DOT/helpers.sh"
source "$DOT/colors.sh"

if [ -f "$HOME/.tmux.conf" ] || [ -L "$HOME/.tmux.conf" ]; then
  echo -e "${RED}warning:${NC} a .tmux.conf file already exists..."
  if boolask "would you like to override? a backup will be placed with name .tmux.conf.backup"; then
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.backup"
  fi
fi

ln -s "$WD/tmux/.tmux.conf" "$HOME/.tmux.conf"
source "./tmux/plugins.sh"
echo -e "${GREEN}completed set up of tmux${NC}"
