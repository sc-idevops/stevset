#!/bin/zsh
#Initializes Prezto
echo "initialize submodules and clone prezto"
git clone --recursive https://github.com/steveokard/prezto.git "$HOME/stevset/prezto/.zprezto"
#fix submodules once and for all
cd $HOME/stevset/prezto/.zprezto && git submodule update --remote && git submodule update
cd ~/.zprezto/modules/prompt/external/powerlevel10k && git checkout master && git pull

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
echo "....configuring theme"
cd && curl -fsSLO https://raw.githubusercontent.com/romkatv/dotfiles-public/master/.purepower

rm $HOME/.zprezto/modules/prompt/functions/prompt_powerlevel10k_setup
ln -s $HOME/.zprezto/modules/prompt/external/powerlevel10k/prompt_powerlevel10k_setup $HOME/.zprezto/modules/prompt/functions/prompt_powerlevel10k_setup
