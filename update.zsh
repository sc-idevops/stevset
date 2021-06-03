#!/bin/zsh
#delete current zsh config
rm ~/.zshrc ~/.zpreztorc ~/.zlogin ~/.zlogout ~/.zprofile ~/.zshenv 
./udeps.sh
./prezto.zsh
