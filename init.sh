#!/bin/bash
#install pre-req.
echo "installing required packages"
sudo apt-get install tmux zsh vim powerline xcape
#remove existing configs, if they exist
rm -ri ~/.tmux.conf
rm -ri ~/.zsh-custom
rm -ri ~/.vimrc
rm -ri ~/.vim
rm -ri ~/.oh-my-zsh
rm -ri ~/.zshrc
#make links
#ln -s /home/`whoami`/stevset/.bash_aliases /home/`whoami`/.bash_aliases
#ln -s /home/`whoami`/stevset/.bashrc /home/`whoami`/.bashrc
ln -s /home/`whoami`/stevset/.tmux.conf /home/`whoami`/.tmux.conf
ln -s /home/`whoami`/stevset/.zshrc /home/`whoami`/.zshrc
ln -s /home/`whoami`/stevset/.oh-my-zsh /home/`whoami`/.oh-my-zsh
ln -s /home/`whoami`/stevset/.vim /home/`whoami`/.vim
ln -s /home/`whoami`/stevset/.vimrc /home/`whoami`/.vimrc

#set new shell
echo "set new shell to zsh"
chsh -s /bin/zsh

echo -n "Would you like to configure your git name and email? (y/n) => "; read answer
if [[ $answer = "Y" ]] || [[ $answer = "y" ]]; then
    echo -n "What is your git user name => "; read name
    git config --global user.name "$name"
    echo -n "What is your git email => "; read email
    git config --global user.email "$email"
fi

echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"

