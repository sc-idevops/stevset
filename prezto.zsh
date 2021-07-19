#!/bin/zsh
CPU_CORES=$(nproc --all)
#Initializes Prezto
git clone --recursive -j $CPU_CORES https://github.com/steveokard/prezto.git "$HOME/.zprezto"

#Remove old stuff
echo "....Creating symlinks"
rm -rf ~/.zshrc ~/.zsh ~/.zprofile ~/.zlogin ~/.zlogout ~/.zpreztorc ~/.zshenv

#Make Environment Links, per github readme
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
	  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

#setup theme
echo "remember to run p10k configure to configure the theme!"

