#!/bin/bash

## If passed the c flag, trash the current config
while getopts ":c" option; do
  case $option in
  c)
    echo "Clearing configurations"
    trash -f ~/.vim/
    mkdir -p ~/.vim/pack/tpope/start
    git clone https://tpope.io/vim/sensible.git ~/.vim/pack/tpope/start
    trash -f ~/.config/nvim/
    trash -f ~/.local/state/nvim/
    trash -f ~/.local/share/nvim/
    trash -f ~/.cache/nvim
    ;;
  esac
done

echo "   >>> Install/Update Neovim & Neovide"
mkdir -v ~/bin
trash -f ~/bin/nvim
curl -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage -o ~/bin/nvim
chmod u+x ~/bin/nvim

trash -f ~/bin/neovide
curl -L https://github.com/neovide/neovide/releases/latest/download/neovide.AppImage -o ~/bin/neovide
chmod u+x ~/bin/neovide

echo "   >>> Install Lazyvim"
# https://www.lazyvim.org/installation
ln -s $HOME/stevset/nvim ~/.config/nvim

#set as editor for root
CUSTOM_NVIM_PATH=$HOME/bin/nvim
# Set the above with the correct path, then run the rest of the commands:
set -u
sudo update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110
