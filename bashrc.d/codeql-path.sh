local_codeql=/opt/$(ls /opt | grep -i codeql | sort -V | tail -1)
if [[ "$local_codeql" != "/opt/" ]]; then
  export PATH=$PATH:$local_codeql
else
  vs_codeql=$HOME/.vscode-remote/data/User/globalStorage/github.vscode-codeql
  bin=$(ls $vs_codeql/*/codeql/codeql -t 2>/dev/null | head -1)
  if [[ -n $bin ]]; then
    export PATH=$PATH:$(dirname "$bin")
  fi
fi
