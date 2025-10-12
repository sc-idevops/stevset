#!/bin/bash
#install pre-req.
distro=$(lsb_release -is)
case $distro in
Debian)
  bash deps/ddeps.sh
  ;;
Ubuntu)
  bash deps/udeps.sh
  ;;
Bazzite)
  bash deps/baz_deps.sh
  ;;
o)
  bash deps/odeps.sh
  ;;
a)
  bash deps/adeps.sh
  ;;
f)
  bash deps/fdeps.sh
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

echo "Initializing Prezto"
zsh prezto.zsh
echo "Enter user password to change shell"
chsh -s /usr/bin/zsh
echo "Set Bash Sensible"
#set sensible defaults for bash as well
if ! grep -q ".sensible.bash" "$HOME/.bashrc"; then
  echo "source \"\$HOME/.sensible.bash\"" >>"$HOME/.bashrc"
fi

#init TMP
echo "set up Tmux Plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#install neovim & lazyvim
echo "Installing lazyvim!"
bash ./lazyvim.sh -c

flat_timer() {
  #this copies and activates a systemd service to enable automatic flatpak updates
  mkdir -pv $HOME/.config/systemd/user/
  cp ./scripts/systemd/flatpak* $HOME/.config/systemd/user/
  systemctl --user enable --now flatpak-update.timer
}

# Functions
git config --global user.name "steveokard"
git config --global user.email "steveokard@gmail.com"
echo "installing fonts"
mkdir ~/.fonts
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/SourceCodePro.tar.xz -O - | tar -xJf - -C ~/.fonts
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/UbuntuMono.tar.xz -O - | tar -xJf - -C ~/.fonts
if command -v flatpak &>/dev/null; then
  flat_timer
fi

echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"
