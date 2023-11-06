#!/bin/bash
#These are the programs I expect to find on any install
function dpkg_url() {
  local tmp_deb="$(mktemp)"
  local src_url=$1
  local args=${@:2}

  wget -q --show-progress -O $tmp_deb $src_url &&
  sudo dpkg -i $tmp_deb $args &&
  { rm -f $tmp_deb; true; } || # commands above succeeded, remove tmp file
  { rm -f $tmp_deb; false; }   # commands above failed, remove tmp file anyway
}

# installing base dependencies
sudo apt-get -my install \
  git \
  wget \
  stow \
  etckeeper \
  tmux \
  zsh \
  powerline\
  htop \
  mc \
  curl \
  aptitude \
  nnn \
  ack \
  fzf \
  ripgrep \
  grc \
  fd-find \
  ncdu \
  exa \
  trash-cli \
  bat \
  nala \
  duf

read -n1 -p $'\nDoes this system need a ssh server?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then 
		sudo apt-get install openssh-server fail2ban
	fi
read -n1 -p $'\nDoes this system have a GUI?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then
    sudo apt-get install synaptic emacs vim-gtk3 
	else
	  sudo apt-get install emacs-nox
	fi

#This section installs software outside apt
dpkg_url https://github.com/dandavison/delta/releases/download/0.16.5/git-delta_0.16.5_amd64.deb

#install neovim
mkdir -v ~/bin
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o ~/bin/nvim
chmod u+x ~/bin/nvim
