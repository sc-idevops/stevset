#!/bin/bash
#These are the programs I expect to find on any install

echo "installing base dependencies"
sudo zypper install \
  ack \
  curl \
  duf \
  etckeeper \
  fzf \
  git \
  git-delta \
  grc \
  htop \
  lua51 \
  lua51-luarocks \
  mailutils \
  make \
  mc \
  mutt \
  ncdu \
  neovim \
  nnn \
  powerline \
  ripgrep \
  stow \
  tmux \
  trash-cli \
  tree \
  vim \
  wl-clipboard \
  wget \
  xclip \
  zsh

pip install trash-cli


read -n1 -p $'Does this system need ssh access?\n' REPLY
if [[ $REPLY == [Yy] ]]; then
  sudo zypper install openssh-server fail2ban
  trash ~/.zshrc_prelocal
fi
read -n1 -p $'\nDoes this system have a GUI?\n' REPLY
if [[ $REPLY == [Yy] ]]; then
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi
#setup git-delta
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3
  echo "Install lazygit"
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit -D -t /usr/local/bin/
  trash lazygit lazygit.tar.gz
