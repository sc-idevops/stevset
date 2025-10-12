#!/bin/bash
#These are the programs I expect to find on any install

echo "installing base dependencies"
sudo dnf install \
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
    fzf \
    bat \
    duf

