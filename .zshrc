# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# General aliases
alias dev="cd ~/Sites"
alias nbuild="npm run build"
alias nwatch="npm run watch"
alias ybuild="yarn run build"
alias ywatch="yarn run watch"
alias ydev="yarn run dev"

# PHP aliases
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias psalm='bash vendor/bin/psalm'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Function to automatically use the version of NVM present in the directory we're changing to
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Load in oh my zsh
source "$ZSH/oh-my-zsh.sh"

# Plugins
plugins=(git)

# Set default editor to Vim
export EDITOR=/usr/bin/vim

# Set the git editor
export GIT_EDITOR=vim
