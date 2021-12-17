if [[ $CODESPACE_VSCODE_FOLDER == /workspaces/semmle-code ]]; then
  export PATH=$PATH:$CODESPACE_VSCODE_FOLDER/target/intree/codeql
  ql_pre_commit=$CODESPACE_VSCODE_FOLDER/.git/modules/ql/hooks/pre-commit
  if [[ ! -f $ql_pre_commit ]]; then
    sed 's=^exit =python3 config/sync-files.py \&\& exit =' $CODESPACE_VSCODE_FOLDER/ql/misc/scripts/pre-commit > $ql_pre_commit
    chmod +x $ql_pre_commit
  fi
fi
