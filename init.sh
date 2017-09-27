#!/bin/zsh
#install pre-req.
echo "installing required packages"
./deps.zsh

#remove existing configs, if they exist
echo "removing symlinks"
rm -ri ~/.tmux.conf
rm -ri ~/.zsh
rm -ri ~/.vimrc
rm -ri ~/.vim
rm -ri ~/.zshrc

#make links
echo "making new symlinks"
ln -s /home/`whoami`/stevset/.tmux.conf /home/`whoami`/.tmux.conf
ln -s /home/`whoami`/stevset/.zshrc /home/`whoami`/.zshrc
ln -s /home/`whoami`/stevset/.vim /home/`whoami`/.vim
ln -s /home/`whoami`/stevset/.vimrc /home/`whoami`/.vimrc
ln -s /home/`whoami`/stevset/.zsh /home/`whoami`/.zsh

#set new shell
echo "set new shell to zsh"
if [[ $SHELL != "/bin/zsh" ]] 
then
	chsh -s /bin/zsh
fi

#init git
echo -n "Would you like to configure your git name and email? (y/n) => "; read answer
if [[ $answer = "Y" ]] || [[ $answer = "y" ]]; then
    echo -n "What is your git user name => "; read name
    git config --global user.name "$name"
    echo -n "What is your git email => "; read email
    git config --global user.email "$email"
fi

#Download Antibody
echo "downloading antibody"
curl -sL https://git.io/antibody | bash -s
#echo 'source <(antibody init)' >> ~/.zshrc

#Install fonts
if [[ -n "$SSH_CLIENT" ]]
then
	break
else
	./fonts.zsh
fi

#init vim and plugins
./vim.zsh

#init spacemacs in the background
./spacemacs.zsh

echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"

