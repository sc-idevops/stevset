#!/bin/bash
#install pre-req.
sudo apt-get install tmux zsh vim
#backup existing configs, if they exist

#make links
ln -s /home/`whoami`/stevset/.bash_aliases /home/`whoami`/.bash_aliases
ln -s /home/`whoami`/stevset/.bashrc /home/`whoami`/.bashrc
ln -s /home/`whoami`/stevset/.tmux.conf /home/`whoami`/.tmux.conf
ln -s /home/`whoami`/stevset/.zshrc /home/`whoami`/.zshrc
ln -s /home/`whoami`/stevset/.oh-my-zsh /home/`whoami`/.oh-my-zsh
ln -s /home/`whoami`/stevset/.vim /home/`whoami`/.vim
ln -s /home/`whoami`/stevset/.vimrc /home/`whoami`/.vimrc
