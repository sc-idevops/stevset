#!/bin/bash
#These are the programs I expect to find on any install
# installing base dependencies
sudo pacman -Sy --needed \
  ack \
  bat \
  curl \
  duf \
  dust \
  etckeeper \
  fd \
  fzf \
  git \
  git-delta \
  grc \
  htop \
  lazygit \
  lua \
  luarocks \
  mailutils \
  make \
  mc \
  mutt \
  ncdu \
  neovim \
  neovide \
  nnn \
  powerline ripgrep \
  stow \
  tmux \
  trash-cli \
  tree \
  wget \
  wl-clipboard \
  zsh

read -n1 -p $'Does this system need a ssh server?\n' REPLY
if [[ $REPLY == [Yy] ]]; then
  sudo pacman -Sy --needed openssh-server fail2ban
fi

read -n1 -p $'\nDoes this system have a GUI?\n' REPLY
if [[ $REPLY == [Yy] ]]; then
  sudo pacman -Sy flatpak
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi

git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3

#script to link to stevserver over LAN. Note: the username in the filename and file have to match yours.
echo -n "Will you need to connect to stev-server?"
read -r answer
if [[ $answer == [Yy] ]]; then
  sudo pacman -Sy nfs-utils
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
