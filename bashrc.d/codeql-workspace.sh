if [[ $CODESPACE_VSCODE_FOLDER == /workspaces/codeql ]]; then
  ql_pre_commit=$CODESPACE_VSCODE_FOLDER/.git/hooks/pre-commit
  if [[ ! -f $ql_pre_commit ]]; then
    sed 's=^exit =python3 config/sync-files.py \&\& exit =' $CODESPACE_VSCODE_FOLDER/misc/scripts/pre-commit > $ql_pre_commit
    chmod +x $ql_pre_commit
  fi
fi
