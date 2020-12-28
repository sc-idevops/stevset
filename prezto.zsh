#!/bin/zsh
#Initializes Prezto
git clone --recursive -j 4 https://github.com/steveokard/prezto.git "$HOME/stevset/prezto/.zprezto"

#Remove old stuff
echo "....Creating symlinks"
rm -rf ~/.zshrc ~/.zsh ~/.zprofile ~/.zlogin ~/.zlogout ~/.zpreztorc ~/.zshenv

#Make Environment Links, per github readme
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/stevset/prezto/.zprezto/runcoms/^README.md(.N); do
	  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

#setup theme
echo "remember to run p10k configure to configure the theme!"
ln -s $HOME/.zprezto/modules/prompt/external/powerlevel10k/prompt_powerlevel10k_setup $HOME/.zprezto/modules/prompt/functions/prompt_powerlevel10k_setup

#finally, fix permissions to avoid compaudit flag
chmod -R go-w ~/.zprezto 

