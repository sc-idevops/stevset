#!/bin/bash
#These are the programs I expect to find on any install

echo "installing base dependencies"
sudo apt-get -my install git \
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

read -n1 -p $'Does this system need ssh access?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then 
		sudo apt-get install openssh-server
	fi
read -n1 -p $'\nDoes this system have a GUI?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then 
		sudo apt-get install emacs synaptic
	else 
		sudo apt-get install emacs-nox
	fi

