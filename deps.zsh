#!/bin/sh
#These are the base dependencies for any install

echo "installing base dependencies"
sudo apt-get -m install openssh-server \
	stow \
	tmux \
	zsh \
        vim \
	powerline\
	htop \
	mc \
	curl \
	byobu \
	#emacs need to find a way to select cmd only or with GUI

echo "enabling byobu"
byobu-enable

