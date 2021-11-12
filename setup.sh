#!/bin/bash

sudo apt-get install -y bash-completion ack-grep

git config --global core.editor "code --wait"

# git aliases
git config --global alias.st status
git config --global alias.cp cherry-pick
git config --global alias.hist "log --oneline --decorate"
git config --global alias.amend "commit --amend"
