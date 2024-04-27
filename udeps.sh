#!/bin/bash
#These are the programs I expect to find on any install
function dpkg_url() {
  local tmp_deb="$(mktemp)"
  local src_url=$1
  local args=${@:2}

  wget -q --show-progress -O $tmp_deb $src_url &&
  sudo dpkg -i $tmp_deb $args &&
  { rm -f $tmp_deb; true; } || # commands above succeeded, remove tmp file
  { rm -f $tmp_deb; false; }   # commands above failed, remove tmp file anyway
}

# installing base dependencies
sudo apt-get -my install \
  git \
  vim \
  stow \
  etckeeper \
  tmux \
  zsh \
  powerline\
  htop \
  mc \
  curl \
  aptitude \
  nnn \
  ack \
  fzf \
  ripgrep \
  grc \
  fd-find \
  ncdu \
  tree \
  neofetch \
  trash-cli \
  nala \
  libfuse2 \
  make \
  neovim \
  shellcheck

read -n1 -p $'Does this system need a ssh server?\n' REPLY
  if [[ $REPLY == [Yy] ]]; then
    sudo apt-get install openssh-server fail2ban
  fi
read -n1 -p $'\nDoes this system have a GUI?\n' REPLY
  if [[ $REPLY == [Yy] ]]; then
    sudo apt-get install synaptic 
  fi

release=`lsb_release -cs`
if [[ $release == jammy || $release == noble ]]; then
  sudo apt install \
    bat \
    duf \
    btop
fi

#This section installs software outside apt
dpkg_url https://github.com/dandavison/delta/releases/download/0.17.0/git-delta_0.17.0_amd64.deb
dpkg_url https://github.com/bootandy/dust/releases/download/v1.0.0/du-dust_1.0.0-1_amd64.deb
dpkg_url https://github.com/charmbracelet/glow/releases/download/v1.5.1/glow_1.5.1_amd64.deb
dpkg_url https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb

