#!/bin/zsh
#This will install Spacemacs (again)
#cleanup 
if [ -d "$HOME/.emacs.d" ]; then
  echo "Moved Doom Config"
  mv ~/.emacs.d ~/doom.d
fi

#Select Stable or Develop
read -n1 -p $"Should we use the development version of emacs? \n" dist
if [[ $dist = y ]] then
  git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
else 
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi 

