# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download and install zinit if it does not exist.
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir  -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Add PowerLevel10k.
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add zsh plugins.
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Autoload completions.
autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add history.
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# COMPLETION CONFIGURATION
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # Case insensitive completion.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Colored completions.

# Aliases
alias ls='ls --color' # Colored ls command.
alias p="cd ~/Documents/Programmering/Projekter && clear"

export PATH=${PATH}:/usr/local/go/bin
export PATH=${PATH}:$(go env GOPATH)/bin
