#!/bin/bash
echo "Setting up Vim Sensible"
trash ~/.vim/
mkdir -p ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/sensible.git ~/.vim/pack/tpope/start

echo "Install Neovim"
mkdir -v ~/bin
if [[ -f "/usr/bin/neovim" ]]; then
  trash ~/bin/nvim 
  curl -L https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.appimage -o ~/bin/nvim
  chmod u+x ~/bin/nvim
fi 

echo "Install NvChad"
# https://nvchad.com/docs/quickstart/install
trash ~/.config/nvim/
trash ~/.local/state/nvim/
trash ~/.local/share/nvim/
trash ~/.cache/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
