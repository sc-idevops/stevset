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
  vim \
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
	tree \
	neofetch 
  nala

read -n1 -p $'Does this system need a ssh server?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then 
		sudo apt-get install openssh-server fail2ban
	fi
read -n1 -p $'\nDoes this system have a GUI?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then 
		sudo apt-get install synaptic emacs vim-gtk3
	else
	  sudo apt-get install emacs-nox
	fi

release=`lsb_release -cs`
if [[ $release == jammy ]]; then
  sudo apt install \
    bat \
    duf \
    btop
  else
    dpkg_url https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.deb
    dpkg_url https://github.com/sharkdp/bat/releases/download/v0.22.1/bat_0.22.1_amd64.deb
fi

#This section installs software outside apt
dpkg_url https://github.com/ClementTsang/bottom/releases/download/0.7.1/bottom_0.7.1_amd64.deb
dpkg_url https://github.com/dandavison/delta/releases/download/0.15.1/git-delta_0.15.1_amd64.deb || dpkg_url https://github.com/dandavison/delta/releases/download/0.15.1/git-delta-musl_0.15.1_amd64.deb
