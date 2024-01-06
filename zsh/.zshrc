export ZSHPATH="$HOME/.config/zsh"
export DOT="$HOME/.dotfiles"

if [ -d $ZSHPATH ]; then
  for file in $ZSHPATH/*.sh; do
    source $file
  done
fi

# source $ZSHPATH/aliases.zsh
