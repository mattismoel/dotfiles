export ZSHPATH="$HOME/.config/zsh"
export DOT="$HOME/.dotfiles"

# Loops over each file in zsh config directory and sources them.
# Makes sure that the "install.sh" is not sourced,
# as that is done by the main dotfile "$DOT/install.sh" script.
if [ -d $ZSHPATH ]; then
  for file in $ZSHPATH/*.sh; do
    if [ "$(basename $file)" = "install.sh" ]; then
      continue
    fi
    source $file
  done
fi

