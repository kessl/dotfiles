#!/usr/bin/env bash

# Decrypts secret dotfiles and moves them to home directory.

# To encrypt secrets, place them in secrets/ and create a tarball
# tar czf secrets.tar.gz secrets/

# then encrypt it using GPG
# gpg --encrypt --recipient your@email secrets.tar.gz


SECRETS_DIR=~/.secrets;

# Decrypt. Requires recipient private key to be imported in GnuPG
gpg --decrypt secrets.tar.gz.gpg > secrets.tar.gz;

# Unpack
tar xzf secrets.tar.gz;

# Copy to $SECRETS_DIR
mkdir -p $SECRETS_DIR;
rsync -a secrets/ $SECRETS_DIR;
rm -rf secrets.tar.gz secrets/

# Symlink secrets to their original locations
# EDIT THIS to reflect your secrets
mkdir -p ~/.ssh;
ln -s $SECRETS_DIR/.ssh/* ~/.ssh/;

mkdir -p ~/.config/rclone;
ln -s $SECRETS_DIR/.config/rclone/* ~/.config/rclone/;

mkdir -p ~/.dsgui;
ln -s $SECRETS_DIR/.dsgui/* ~/.dsgui;
