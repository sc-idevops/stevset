#!/bin/zsh
CPU_CORES=$(nproc --all)
#Initializes Prezto
git clone --recursive -j $CPU_CORES https://github.com/sc-idevops/prezto.git "$HOME/.zprezto"

#Remove old stuff
echo "....Creating symlinks"
trash ~/.zshrc ~/.zsh ~/.zprofile ~/.zlogin ~/.zlogout ~/.zpreztorc ~/.zshenv

#Make Environment Links, per github readme
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
	  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

#override keybindings
sed -i '/history-incremental-search-backward/s/^/# /' $HOME/.zprezto/contrib/zsh-vi-mode/zsh-vi-mode.zsh
sed -i '/history-incremental-search-forward/s/^/# /' $HOME/.zprezto/contrib/zsh-vi-mode/zsh-vi-mode.zsh
