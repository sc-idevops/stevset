#!/bin/bash
#These are the programs I expect to find on any install

echo "installing base dependencies"
sudo zypper install \
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
    ncdu \
    bat \
    duf \
    bottom
#need an exa alternative
read -n1 -p $'Does this system need ssh access?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then 
		sudo zypper install openssh-server
	fi
read -n1 -p $'\nDoes this system have a GUI?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then 
		sudo zypper install emacs 
	else 
		sudo zypper install emacs-nox
	fi

