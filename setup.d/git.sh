git config --global core.editor "code --wait"

# git aliases
git config --global alias.gconf "config --global"
git gconf alias.st status
git gconf alias.cp cherry-pick
git gconf alias.hist "log --oneline --decorate"
git gconf alias.amend "commit --amend"
git gconf alias.ch checkout
git gconf alias.su "submodule update --init --recursive"
git gconf alias.sw switch
git gconf alias.br branch
