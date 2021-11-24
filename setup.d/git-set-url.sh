find /workspaces -name .git | while read git; do
  (
    cd $(dirname $git)
    git status &>/dev/null || exit 0
    url=$(git remote get-url origin | sed 's=https://github.com/=git@github.com:=')
    git remote set-url origin $url
    echo rewritten $PWD url
  )
done