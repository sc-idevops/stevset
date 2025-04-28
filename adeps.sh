#!/bin/bash
#These are the programs I expect to find on any install
# installing base dependencies
sudo pacman -Sy --needed \
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
  nnn \
  fzf \
  ripgrep \
  grc \
  fd \
  ncdu \
  ripgrep \
  exa \
  bat \
  trash-cli \
  bat \
  duf \
  dust

read -n1 -p $'Does this system need a ssh server?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then 
		sudo pacman -Sy --needed openssh-server fail2ban
	fi
