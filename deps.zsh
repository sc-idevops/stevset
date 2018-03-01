#!/bin/sh
#These are the base dependencies for any install

echo "installing base dependencies"
sudo apt-get -m install openssh-server \
	tmux \
	zsh \
        vim \
	powerline\
	htop \
	mc \
	curl \
	byobu \
	emacs

echo "enabling byobu"
byobu-enable

