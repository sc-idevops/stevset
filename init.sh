#!/bin/bash
#install pre-req.
echo "installing required packages"
./deps.sh
#remove existing configs, if they exist
#rm -ri ~/.tmux.conf
#rm -ri ~/.zsh-custom
#rm -ri ~/.vimrc
#rm -ri ~/.vim
#rm -ri ~/.zshrc

#make links
ln -s /home/`whoami`/stevset/.tmux.conf /home/`whoami`/.tmux.conf
ln -s /home/`whoami`/stevset/.zshrc /home/`whoami`/.zshrc
ln -s /home/`whoami`/stevset/.vim /home/`whoami`/.vim
ln -s /home/`whoami`/stevset/.vimrc /home/`whoami`/.vimrc
ln -s /home/`whoami`/stevset/.zsh /home/`whoami`/.zsh

#Download Antigen
curl -sL https://git.io/antibody | bash -s
echo 'source <(antibody init)' >> ~/.zshrc

#set new shell
echo "set new shell to zsh"
if [[ $SHELL != "/bin/zsh" ]] 
then
	chsh -s /bin/zsh
fi

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

