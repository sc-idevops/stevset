#!/bin/zsh
echo "Remove Emacs"
sudo apt autoremove emacs emacs-nox ripgrep markdown shellcheck fd-find
rm -r  --interactive=never $HOME/.emacs.d $HOME/.doom.d
