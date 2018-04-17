#!/bin/sh
#These are the base dependencies for any install

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
#	byobu \

read -p "Does this system need ssh access?" -n 1 -r
	if [[ ! $REPLY =~ ^[Yy]$ ]] 
	then sudo apt-get install openssh-server
	fi
read -p "Does this system have a GUI?" -n 1 -r
	if [[ ! $REPLY = [Yy]$ ]]
	then sudo apt-get install emacs
	else sudo apt-get install emacs-nox
	fi

#echo "enabling byobu"
#byobu-enable

