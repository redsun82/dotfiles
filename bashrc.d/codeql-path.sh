vs_codeql=/home/codespace/.vscode-remote/data/User/globalStorage/github.vscode-codeql
distrib=$(ls $vs_codeql -t 2>/dev/null | head -1)
if [[ -n $distrib ]]; then
  export PATH=$PATH:$vs_codeql/$distrib/codeql
fi
