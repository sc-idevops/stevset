#!/bin/zsh
#Initializes Prezto
echo "initialize submodules and clone prezto"
git clone --recursive -j 4 https://github.com/steveokard/prezto.git "$HOME/stevset/prezto/.zprezto"
#Remove old stuff
echo "....Creating symlinks"
rm -rf ~/.zshrc ~/.zsh ~/.zprofile ~/.zlogin ~/.zlogout ~/.zpreztorc ~/.zshenv

#Make Environment Links, per github readme
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/stevset/prezto/.zprezto/runcoms/^README.md(.N); do
	  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

#Fix History if it exists
if test -f "~/.zsh_history"; then
    cat ~/.zsh_history > ~/.zhistory
fi

#extra setup for powerlevel10k theme
echo "remember to run p10k configure to configure the theme!"
#ln -s $HOME/stevset/.p10k.zsh $HOME/

rm $HOME/.zprezto/modules/prompt/functions/prompt_powerlevel10k_setup
ln -s $HOME/.zprezto/modules/prompt/external/powerlevel10k/prompt_powerlevel10k_setup $HOME/.zprezto/modules/prompt/functions/prompt_powerlevel10k_setup

#finally, fix permissions to avoid compaudit flag
chmod -R go-w ~/.zprezto 
