#!/bin/bash
#install pre-req.
<<<<<<< HEAD
. /etc/os-release
case $ID in
debian)
  bash ddeps.sh
||||||| a25d199
distro=$(lsb_release -is)
case $distro in
Debian)
  bash ddeps.sh
=======
distro=$(lsb_release -is)
case $distro in
Debian)
  bash deps/ddeps.sh
>>>>>>> master
  ;;
<<<<<<< HEAD
ubuntu | "linux mint")
  bash udeps.sh
||||||| a25d199
Ubuntu)
  bash udeps.sh
=======
Ubuntu)
  bash deps/udeps.sh
>>>>>>> master
  ;;
Bazzite)
  bash deps/baz_deps.sh
  ;;
<<<<<<< HEAD
opensuse-leap | opensuse-tumbleweed)
  bash odeps.sh
||||||| a25d199
o)
  bash odeps.sh
=======
o)
  bash deps/odeps.sh
>>>>>>> master
  ;;
<<<<<<< HEAD
arch)
  bash adeps.sh
||||||| a25d199
a)
  bash adeps.sh
=======
a)
  bash deps/adeps.sh
>>>>>>> master
  ;;
<<<<<<< HEAD
fedora)
  bash fdeps.sh
||||||| a25d199
f)
  bash fdeps.sh
=======
f)
  bash deps/fdeps.sh
>>>>>>> master
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
  mkdir -pv "$HOME/.config/systemd/user/"
  cp ./scripts/systemd/flatpak* "$HOME/.config/systemd/user/"
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
