#!/bin/zsh
#Initializes Prezto
#make link to stevset
stow prezto
# Clone Prezto
git clone --recursive https://github.com/steveokard/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
#Make Environment Links, per github readme
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
	  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

