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


# Checks if a symlink already exists.
symlinkexists () {
  if [ -L "$1" ]; then
    return 0
  fi
  return 1
}

