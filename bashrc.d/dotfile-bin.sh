dotfiles=/workspaces/.codespaces/.persistedshare/dotfiles
if [[ -d $dotfiles ]]; then
    export PATH=$PATH:$dotfiles/bin
fi
    