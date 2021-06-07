#!/bin/bash
#These are the programs I expect to find on any install

echo "installing base dependencies"
sudo apt-get -my install \
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
	aptitude \
  nnn \
  ack \
  fzf \
  ripgrep \
  fd-find

read -n1 -p $'Does this system need a ssh server?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then 
		sudo apt-get install openssh-server
	fi
read -n1 -p $'\nDoes this system have a GUI?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then 
		sudo apt-get install synaptic emacs
	else
	  sudo apt-get install emacs-nox
	fi

