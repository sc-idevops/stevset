#!/bin/zsh
echo "Remove Doom"
rm -r  --interactive=never $HOME/.emacs.d $HOME/.doom.d

echo "Install zinit"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
#This will install Zinit in ~/.zinit/bin. .zshrc will be updated with three lines of code that wi       │ ll be added to the bottom. The lines will be sourcing zinit.zsh and setting up completion for com       │ mand zinit. After installing and reloading the shell compile Zinit with zinit self-update. 
rm ~/.zshrc ~/.zpreztorc ~/.zlogin ~/.zlogout ~/.zprofile ~/.zshenv
ln -s ~/stevset/zsh/.zshrc ~/.zshrc 
ln -s ~/stevset/zsh/aliases.zsh ~/.zsh_aliases
ln -s ~/stevset/zsh/.zprofile ~/.zprofile
source ~/.zshrc
