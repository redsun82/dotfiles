sed -ni '/^# dotfiles/,$!p' ~/.bashrc
echo "# dotfiles" >> ~/.bashrc

for s in bashrc.d/*.sh; do
  echo updating .bashrc with $(basename $s)
  echo >> ~/.bashrc
  echo "# $s" >> ~/.bashrc
  cat $s >> ~/.bashrc
done
