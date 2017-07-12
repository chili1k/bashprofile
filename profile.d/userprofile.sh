#!/bin/bash

os=$(uname)

# Functions
git_branch_prompt() {
  branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
  test -n "$branch" && echo "($branch) "
}

export PS1="\w \033[0;32m\$(git_branch_prompt)\033[0m[\A]$ "

# Aliases
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

if [ "$os" == "Darwin" ]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alhF'
alias ..='cd ..'
alias ports='netstat -tulanp'
alias guid="uuidgen | tr '[:upper:]' '[:lower:]'"

if [ "$os" == "Darwin" ]; then
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
fi

