#!/bin/bash

## If passed the c flag, trash the current config
while getopts ":c" option; do
  case $option in
  c)
    echo "Clearing configurations"
    trash ~/.vim/
    mkdir -p ~/.vim/pack/tpope/start
    git clone https://tpope.io/vim/sensible.git ~/.vim/pack/tpope/start
    trash ~/.config/nvim/
    trash ~/.local/state/nvim/
    trash ~/.local/share/nvim/
    trash ~/.cache/nvim
    ;;
  esac
done

echo "Install/Update Neovim & Neovide"
mkdir -v ~/bin
trash ~/bin/nvim
curl -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage -o ~/bin/nvim
chmod u+x ~/bin/nvim
curl -L https://github.com/neovide/neovide/releases/latest/download/neovide.AppImage -o ~/bin/neovide
chmod u+x ~/bin/neovide

echo "Install Lazyvim"
# https://www.lazyvim.org/installation
if [ ! -d "~/.config/nvim" ]; then
  git clone https://github.com/LazyVim/starter ~/.config/nvim
fi
