#!/bin/zsh
#Initializes Prezto

# Clone Prezto
git clone --recursive https://Stefenauris@bitbucket.org/Stefenauris/prezto-fork.git "${ZDOTDIR:-$HOME}/stevset/prezto/.zprezto"

#Remove old stuff
rm -rf ~/.zshrc ~/.zsh ~/.zprofile

#Make Environment Links, per github readme
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/stevset/prezto/.zprezto/runcoms/^README.md(.N); do
	  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

#Fix History if it exists
cat ~/.zsh_history > ~/.zhistory
