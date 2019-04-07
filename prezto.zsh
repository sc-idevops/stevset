#!/bin/zsh
#Initializes Prezto

#Remove old stuff
rm -rf ~/.zshrc ~/.zsh ~/.zprofile

#Make Environment Links, per github readme
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/stevset/prezto/.zprezto/runcoms/^README.md(.N); do
	  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

#Fix History if it exists
cat ~/.zsh_history > ~/.zhistory

#extra setup for powerlevel10k theme
cd && curl -fsSLO https://raw.githubusercontent.com/romkatv/dotfiles-public/master/.purepower
ln -s ~/.zprezto/modules/prompt/{external/powerlevel10k/powerlevel10k.zsh-theme,functions/prompt_powerlevel10k_setup}
