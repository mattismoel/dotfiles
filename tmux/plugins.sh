source "$DOT/helpers.sh"
source "$DOT/colors.sh"

# Exit if git is not installed on system.
if ! command -v git &> /dev/null; then
  echo -e "${RED}warning${NC}: git is not installed on this system. exiting..."
  exit 1
fi

# Links to git plugin repos. The array contains tuples in the format "<link> <plugin_name>".
# This array should only contain plugins to be bootstrapped. Other plugins should be given in the "tmux.conf" file!
plugins=("https://github.com/tmux-plugins/tpm tpm")


# Loops over all the plugin tuples in the "plugins" array, and installs them if not already installed.
for plugin in "${plugins[@]}"; do
  read -ra tuple <<< "$plugin"
  if [ -d "$HOME/.tmux/plugins/${tuple[1]}" ]; then
    echo "${tuple[1]} is already installed. skipping..."
    continue
  fi

  echo -e "${BLUE}installing ${tuple[1]}...${NC}"
  # Clone plugin to ~/.tmux/plugins/<plugin_name>
  git clone "${tuple[0]}" "$HOME/.tmux/plugins/${tuple[1]}"
done

