#!/bin/zsh
rm ~/.ssh/config
stow config
sudo systemctl daemon-reload
systemctl --user enable emacs
systemctl --user start emacs
systemctl --user status emacs
echo "you should start emacs and update all the packages!"

