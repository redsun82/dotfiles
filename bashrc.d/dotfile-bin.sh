dotfiles=(\
    /workspaces/.codespaces/.persistedshare/dotfiles \
    /workspaces/dotfiles \
)
for d in "${dotfiles[@]}"; do
    if [[ -d "$d" ]]; then
        export PATH="$PATH:$d/bin"
        break
    fi
done
