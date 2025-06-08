#!/bin/bash
echo "Installing Spacevim!"

echo "Install Neovim"
mkdir -v ~/bin
trash ~/bin/nvim 
curl -L https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.appimage -o ~/bin/nvim
chmod u+x ~/bin/nvim

echo "Install NvChad"
git clone https://github.com/NvChad/starter ~/.config/nvim

#echo "Install Lunar Vim"
#source: https://www.lunarvim.org/docs/installation
#LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
