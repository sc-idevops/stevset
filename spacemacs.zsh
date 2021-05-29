#!/bin/zsh
#This will install Spacemacs (again)
#cleanup 
echo "Removing old emacs"
if [ -e ~/.emacs.d/]
    then
      mv ~/.emacs.d ~/doom.d
fi

#Select Stable or Develop
read -p "Should we use the development version of emacs?" dist
if [[ $dist = y ]] then
  git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
else 
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi 
