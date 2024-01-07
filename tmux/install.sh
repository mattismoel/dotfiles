source "$DOT/helpers.sh"
source "$DOT/colors.sh"

if [ -d "$HOME/.config/tmux" ]; then
  echo -e "${RED}warning:${NC} a tmux configuration folder already exists..."
  if boolask "would you like to override? a backup will be placed at ~/.config/tmux.backup/"; then
    mv -r "$HOME/.config/tmux/" "$HOME/.config/tmux.backup/"
  fi
fi

# if [ -f "$HOME/.tmux.conf" ] || [ -L "$HOME/.tmux.conf" ]; then
#   echo -e "${RED}warning:${NC} a .tmux.conf file already exists..."
#   if boolask "would you like to override? a backup will be placed with name .tmux.conf.backup"; then
#     mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.backup"
#   fi
# fi
#
#

ln -s "$DOT/tmux/" "$HOME/.config/tmux"
source "./tmux/plugins.sh"
echo -e "${GREEN}completed set up of tmux${NC}"
