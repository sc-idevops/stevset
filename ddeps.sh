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
  neovim \
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
  bottom \
  neofetch

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
#Fix stupid Rust issue
if [ -f "/usr/.crates2.json" ]; then
  sudo sed -i '/crates2/d' /var/lib/dpkg/info/ripgrep.list
  sudo rm -f /usr/.crates2.json
  sudo apt-get -my install bat
  sudo sed -i '/crates2/d' /var/lib/dpkg/info/bat.list
  sudo rm -f /usr/.crates2.json
fi

#This section installs software outside apt
dpkg_url https://github.com/muesli/duf/releases/download/v0.6.2/duf_0.6.2_linux_amd64.deb
