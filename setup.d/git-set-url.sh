find /workspaces -name .git | while read git; do
  (
    cd $(dirname $git)
    url=$(git remote get-url origin | sed 's=https://github.com/=git@github.com:=')
    git remote set-url origin $url
  )
done