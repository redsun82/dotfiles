#!/bin/bash -e

sudo apt-get install -y bash-completion ack-grep tmux byobu

byobu-enable

git config --global core.editor "code --wait"

# git aliases
git config --global alias.st status
git config --global alias.cp cherry-pick
git config --global alias.hist "log --oneline --decorate"
git config --global alias.amend "commit --amend"

sed -ni '/^# dotfiles/,$!p' ~/.bashrc
cat >> ~/.bashrc << EOF
# dotfiles

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias -- -='cd -'

semmle_top=/workspaces/semmle-code
if [[ -d \$semmle_top ]]; then
  export PATH=\$PATH:\$semmle_top/target/intree/codeql
  ql_pre_commit=\$semmle_top/.git/modules/ql/hooks/pre-commit
  if [[ ! -f \$ql_pre_commit ]]; then
    sed 's=^exit =python3 config/sync-files.py \&\& exit =' \$semmle_top/ql/misc/scripts/pre-commit > \$ql_pre_commit
    chmod +x \$ql_pre_commit
  fi
fi
EOF

