#!/bin/bash
#These are the programs I expect to find on any install
# installing base dependencies
sudo pacman -Sy --needed \
  git \
  stow \
  etckeeper \
  tmux \
  zsh \
  vim \
  powerline\
  htop \
  mc \
  curl \
  nnn \
  ack \
  fzf \
  ripgrep \
  grc \
  fd \
  ncdu \
  ripgrep \
  exa \
  bat \
  emacs

read -n1 -p $'Does this system need a ssh server?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then 
		sudo pacman -Sy --needed openssh-server fail2ban
	fi
