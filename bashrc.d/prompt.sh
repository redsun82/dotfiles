MAX_WIDTH_PERCENT=33
MAX_ABSOLUTE_BOUND=60

function align_with_truncation() {
    local w=${#1}
    local max=$(( $(tput cols) * MAX_WIDTH_PERCENT / 100 ))
    if (( max >= MAX_ABSOLUTE_BOUND )); then
       max=$MAX_ABSOLUTE_BOUND
    fi
    if (( w <= max )); then
      printf "%${max}s" "$1"
    else
      echo -n "...${1:$((w - max + 3)):$((max - 3))}"
    fi
}

export PS1='\
$(export RES=$?; echo -n "\[\033[01;34m\]"; \
align_with_truncation "$(dirs +0)"; \
echo -n "\[\033[00m\] "; \
if [[ $RES == "0" ]]; then \
  echo -ne "\[\033[01;32m\]\$\[\033[00m\]"; \
else \
  echo -ne "\[\033[01;31m\]\$\[\033[00m\]"; \
fi) '
