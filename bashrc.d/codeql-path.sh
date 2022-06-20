local_codeql=/opt/$(ls /opt | grep -i codeql | sort -V | tail -1)
if [[ -d "$local_codeql" ]]; then
  export PATH=$PATH:$local_codeql
else
  vs_codeql=$HOME/.vscode-remote/data/User/globalStorage/github.vscode-codeql
  distrib=$(ls $vs_codeql -t 2>/dev/null | head -1)
  if [[ -n $distrib ]]; then
    export PATH=$PATH:$vs_codeql/$distrib/codeql
  fi
fi
