#!/bin/sh
#These are the base dependencies for any install

echo "installing base dependencies"
sudo apt-get install tmux \
	zsh \
        vim \
	powerline\
	htop \
	mc\
	curl
#check if on a ssh connection, if you are, emacs doesnt need X
echo "installing emacs, based on X support"

if [[ -n "$SSH_CLIENT" ]]
then
	sudo apt-get install emacs24-nox
else
	sudo apt-get install emacs
fi
