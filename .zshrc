# env
EDITOR='/usr/local/bin/vim'


# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  # generate the init script from plugins above
  zgen save
fi

zgen oh-my-zsh plugins/git
zgen oh-my-zsh plugins/github
zgen load zsh-users/zsh-autosuggestions
zgen load spaceship-prompt/spaceship-prompt spaceship
zgen load zdharma/fast-syntax-highlighting

# initialize rbenv
eval "$(rbenv init -)"

# aliases
alias ll='ls -alh'

# tmux functions
function tmux-start {
  local session=$1
  [ -z "$session" ] && session=`whoami`
  tmux -S /tmp/$session new-session -s $session -d
  chmod 777 /tmp/$session
  tmux -S /tmp/$session attach -t $session
}

function tmux-join {
  local session=$1
  [ -z "$session" ] && session=`whoami`
  tmux -S /tmp/$session new-session -t $session
}

# spaceship conf
# SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL="$"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_NODE_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_CONDA_SHOW=false
SPACESHIP_KUBECTL_VERSION_SHOW=false
SPACESHIP_EXEC_TIME_SHOW=false


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
