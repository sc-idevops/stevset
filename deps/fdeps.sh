#!/bin/bash
#These are the programs I expect to find on any install
sudo dnf config-manager --set-enabled crb
sudo dnf install epel-release

echo "installing base dependencies"
sudo dnf install \
  ack \
  curl \
  etckeeper \
  fzf \
  git \
  htop \
  lua \
  mc \
  ncdu \
  powerline\
  pipx \
  ripgrep \
  stow \
  tmux \
  tree \
  vim \
  wget \
  zsh

pipx install trash-cli



read -n1 -p $'Does this system need a ssh server?\n' REPLY
if [[ $REPLY == [Yy] ]]; then
  sudo dnf install openssh-server fail2ban
  trash ~/.zshrc_prelocal
fi
read -n1 -p $'\nDoes this system have a GUI?\n' REPLY
if [[ $REPLY == [Yy] ]]; then
  sudo dnf install flatpak
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi

echo "Install lazygit"
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit -D -t /usr/local/bin/
  trash lazygit lazygit.tar.gz
fi

#script to link to stevserver over LAN. Note: the username in the filename and file have to match yours.
echo -n "Will you need to connect to stev-server?"
read -r answer
if [[ $answer == [Yy] ]]; then
  sudo dnf install nfs-utils
  sudo cat >/etc/systemd/system/home-$USER-server.mount <<EOF
[Unit]
Description=Automatically Mount Stev-Server NFS Share
After=network-online.target
Wants=network-online.target

[Mount]
What=192.168.1.147:/home/stev
Where=/home/$USER/server
Type=nfs
Options=auto,nofail,noatime

[Install]
WantedBy=remote-fs.target
EOF
  sudo systemctl daemon-reload
  sudo systemctl enable --now home-$USER-server.mount
fi
