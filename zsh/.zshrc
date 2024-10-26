# ~~~~~~~~~~ General Stuff ~~~~~~~~~~
ZSH_THEME="robbyrussell"

if [ "$TMUX" = "" ]; then tmux; fi

# ~~~~~~~~~~~~~~ SSH ~~~~~~~~~~~~~~~~
eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/g0ods1gnal-git > /dev/null 2>&1

# ~~~~~~~ Environment Variables ~~~~~
set -o vi

export VISUAL=nvim
export EDITOR=nvim
export TERM="tmux-256color"

export BROWSER="chromium"

# Directories
export REPOS="$HOME/Repos"
export DOTFILES="$HOME/dotfiles"
export SECONDBRAIN="$HOME/SecondBrain"

# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions

# ~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~
PURGE_GIT_PULL=0

fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

plugins=(git)

# ~~~~~~~~~~~~~~~~ Alias ~~~~~~~~~~~~~
alias v=nvim
alias projects='cd ~/Projects'
alias brain='cd ~/SecondBrain && nvim .'
alias bmw='bmwaws login'

# Repos
alias repos='cd ~/Repos'
alias dot='cd ~/dotfiles'

# ls
alias ls='ls --color=auto'
alias la='ls -lathr'

# find all files recursively and sorts by last modification, ignore hidden files
alias lastmod='find . -type f -not -path "/\.*" -exec ls -lrt {} +'

alias t='tmux'
alias e='exit'

alias update='sudo pacman -Syu'

# Git
alias gp='git pull'
alias gs='git status'

# Kubernetes
alias k='kubectl'
alias kc='kubectx'
alias kn='kubens'


# ~~~~~~~~~~~~~~~~~~~ Completion ~~~~~~~~~~~~~~

fpath+=~/.zfunc

autoload -Uz compinit
compinit -u
