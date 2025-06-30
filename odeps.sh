#!/bin/bash
#These are the programs I expect to find on any install

echo "installing base dependencies"
sudo zypper install \
    git \
    vim \
    stow \
    etckeeper \
    tmux \
    zsh \
    powerline\
    fd \
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
    trash-cli \
    lua54 \
    duf \
    dust \
    neovim

read -n1 -p $'Does this system need ssh access?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then 
		sudo zypper install openssh-server fail2ban
	fi
read -n1 -p $'\nDoes this system have a GUI?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then 
		sudo zypper install emacs 
	else 
		sudo zypper install emacs-nox
	fi
sudo zypper install "https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.rpm"
