#!/bin/bash -e

sudo apt-get install -y bash-completion ack-grep tmux byobu

byobu-enable

git config --global core.editor "code --wait"

# git aliases
git config --global alias.st status
git config --global alias.cp cherry-pick
git config --global alias.hist "log --oneline --decorate"
git config --global alias.amend "commit --amend"

cat >> ~/.bashrc << EOF

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias -- -='cd -'

if [[ -d /workspaces/semmle-code ]]; then
  export PATH=$PATH:/workspaces/semmle-code/target/intree/codeql
fi
EOF

