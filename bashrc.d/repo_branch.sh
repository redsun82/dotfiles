if [[ -d "$CODESPACE_VSCODE_FOLDER" ]]; then
  (
    cd $CODESPACE_VSCODE_FOLDER
    echo $GITHUB_REPOSITORY: $(git rev-parse --abbrev-ref HEAD)
    echo
  )
fi
