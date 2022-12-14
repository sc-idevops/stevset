#!/bin/bash
#This will install Spacemacs
#backup existing files 
echo "backing up existing emacs config"
[ -d $HOME/.emacs.d ] && mv $HOME/.emacs.d $HOME/.emacs.d.bak
[ -f $HOME/.emacs.el ] && mv $HOME/.emacs.el .emacs.el.bak
[ -f $HOME/.emacs ] && mv $HOME/.emacs $HOME/.emacs.bak

git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
