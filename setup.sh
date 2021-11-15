#!/bin/bash -e

sudo apt-get install -y bash-completion ack-grep tmux byobu

byobu-enable

git config --global core.editor "code --wait"

# git aliases
git config --global alias.st status
git config --global alias.cp cherry-pick
git config --global alias.hist "log --oneline --decorate"
git config --global alias.amend "commit --amend"

if [[ -n "$SSH_KEY" ]]; then
  mkdir -p ~/.ssh
  echo $SSH_KEY > ~/.ssh/id_ed25519
  chmod go-rw ~/.ssh/id_ed25519
fi

cat >> ~/.bashrc << EOF

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias -- -='cd -'

unset SSH_KEY
EOF

