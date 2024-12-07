#!/bin/bash
echo "Installing Spacevim!"
[ -d $HOME/.vim ] && mv "$HOME/.vim" "$HOME/vim_bk"
[ -f $HOME/.vimrc ] && mv "$HOME/.vimrc" "$HOME/vimrc_bk"
curl -sLf https://spacevim.org/install.sh | bash -s -- --install vim

echo "Install Neovim"
trash ~/.local/share/nvim ~/.config/nvim #removes spacevim's symlink
mkdir -v ~/bin
if [[ $(lsb_release -cs) != noble ]]; then
  trash ~/bin/nvim 
  curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o ~/bin/nvim
  chmod u+x ~/bin/nvim
else
  sudo apt install neovim
fi

echo "Install NvChad"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

#echo "Install Lunar Vim"
#source: https://www.lunarvim.org/docs/installation
#LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
