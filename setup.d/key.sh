key_file=~/.ssh/id_ed25519
if [[ ! -f $key_file ]]; then
  mkdir -p ~/.ssh
  echo -----BEGIN OPENSSH PRIVATE KEY----- >> $key_file
  for l in $SSH_KEY; do
    echo $l >> $key_file
  done
  echo -----END OPENSSH PRIVATE KEY----- >> $key_file
  chmod go-rw $key_file
fi
