sed -ni '/^# dotfiles/,$!p' ~/.bashrc
echo "# dotfiles" >> ~/.bashrc

cat bashrc >> ~/.bashrc
