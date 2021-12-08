vs_codeql=$(echo /home/codespace/.vscode-remote/data/User/globalStorage/github.vscode-codeql/distribution?/codeql)
if [[ -d $vs_codeql ]]; then
  export PATH=$PATH:$vs_codeql
fi
semmle_top=/workspaces/semmle-code
if [[ -d $semmle_top ]]; then
  export PATH=$PATH:$semmle_top/target/intree/codeql
  ql_pre_commit=$semmle_top/.git/modules/ql/hooks/pre-commit
  if [[ ! -f $ql_pre_commit ]]; then
    sed 's=^exit =python3 config/sync-files.py \&\& exit =' $semmle_top/ql/misc/scripts/pre-commit > $ql_pre_commit
    chmod +x $ql_pre_commit
  fi
fi
