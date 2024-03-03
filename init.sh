#!/bin/bash
#install pre-req.
echo -n "Which Linux flavor will we be installing programs for? (u/o/a)"; read -r answer
case $answer in
  u) 
    bash udeps.sh
    ;;
  o)
    bash odeps.sh
    ;;
  a)
    bash adeps.sh
    ;;
  f)
    bash fdeps.sh
    ;;
  d)
    bash ddeps.sh
    ;;
  *)
    echo "Skipping installation of dependencies!"	
    ;;
esac

#create symlinks using stow
mkdir ~/.ssh
echo "Stowing Configs"
stow config --dotfiles
chmod 0700 ~/.ssh
chmod -R 0600 ~/.ssh/*

#setup shell
stow home
echo "Select which shell to configure and use: zsh/fish/bash"; read -r answer
case $answer in
  z | zsh)
    echo "Initializing Prezto"
    zsh prezto.zsh
    chsh -s /usr/bin/zsh 
    ;;
  f | fish)
    echo "Installing Oh-My-Fish"
    bash fish.sh
    chsh -s /usr/bin/fish
    ;;
  b | bash)
    echo "Installing Bash-It"
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    bash ~/.bash_it/install.sh
    ;;
  *)
    echo "Guess we're sticking with vanilla bash then..."
    #inject source line into bashrc
    if ! grep -q ".sensible.bash" "$HOME/.bashrc"; then
       echo "source \"\$HOME/.sensible.bash\"" >> "$HOME/.bashrc"
    fi
    ;;
esac

#init TMP
echo "set up Tmux Plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


#Configure git user
git_user () {
  echo -n "Would you like to configure your git name and email? (y/n) => "; read -r answer
  if [[ $answer = "Y" ]] || [[ $answer = "y" ]]; then
    echo -n "What is your git user name => "; read -r name
    git config --global user.name "$name"
    echo -n "What is your git email => "; read -r email
    git config --global user.email "$email"
  fi
}

#install spacevim & neovim
spacevim () {
  echo "Installing Spacevim!"
  [ -d $HOME/.vim ] && mv "$HOME/.vim" "$HOME/vim_bk"
  [ -f $HOME/.vimrc ] && mv "$HOME/.vimrc" "$HOME/vimrc_bk"
  curl -sLf https://spacevim.org/install.sh | bash -s -- --install vim
  echo "Install Neovim"
  mkdir -v ~/bin
  trash ~/bin/nvim 
  curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o ~/bin/nvim
  chmod u+x ~/bin/nvim
  trash ~/.local/share/nvim #removes spacevim's symlink
  echo "Install NvChad"
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
  echo "Install Lunar Vim"
  LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
}
#install fonts for terminal
fonts () {
  echo "installing fonts"
  mkdir ~/.fonts
  wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/SourceCodePro.tar.xz -O - | tar -xJf - -C ~/.fonts
}

flat_timer () {
  #this copies and activates a systemd service to enable automatic flatpak updates
  mkdir -pv $HOME/.config/systemd/user/
  ln -s ./scripts/systemd/flatpak* $HOME/.config/systemd/user/
  systemctl --user enable --now flatpak-update.timer
}

git_user
spacevim
fonts
if command -v flatpak &> /dev/null; then
  flat_timer
fi

#script to link to stevserver over LAN. Note: the username in the filename and file have to match yours. 
echo -n "Will you need to connect to stev-server?"; read -r answer
if [[ $answer == [Yy] ]]; then
  sudo cp scripts/systemd/home-stev-server.mount /etc/systemd/system
  sudo systemctl daemon-reload
fi

echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"

