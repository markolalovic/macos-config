export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR='nano'

# ----------------------
# Aliases
# ----------------------
# `l` command works as `ls -la`
alias ll="ls -al" # List all files in current directory in long list format
alias o="open ." # Open the current directory in Finder
alias firefox='open -a /Applications/Firefox.app'
alias firefoxnew='/Applications/Firefox.app/Contents/MacOS/firefox' # guest mode

# ----------------------
# Git Aliases
# ----------------------
alias gaa='git add .'
alias gcm='git commit -m'
alias gpsh='git push'
alias gss='git status -s'

# ----------------------
# NVM
# ----------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ----------------------
# ruby
# ----------------------
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

# --------------------------------
# pyenv
# --------------------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/python"

plugin=(
  pyenv
)

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"