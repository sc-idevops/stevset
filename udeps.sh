#!/bin/bash
#These are the programs I expect to find on any install
function dpkg_url() {
  local tmp_deb="$(mktemp)"
  local src_url=$1
  local args=${@:2}

  wget -O $tmp_deb $src_url &&
  sudo dpkg -i $tmp_deb $args &&
  { rm -f $tmp_deb; true; } || # commands above succeeded, remove tmp file
  { rm -f $tmp_deb; false; }   # commands above failed, remove tmp file anyway
}

# installing base dependencies
sudo apt-get -my install \
  git \
	stow \
	etckeeper \
	tmux \
	zsh \
  vim \
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
  ncdu 

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
sudo sed -i '/crates2/d' /var/lib/dpkg/info/ripgrep.list
sudo rm -f /usr/.crates2.json
sudo apt install bat
sudo sed -i '/crates2/d' /var/lib/dpkg/info/bat.list
sudo rm -f /usr/.crates2.json


#This section installs software outside apt

#select exa or lsd
dpkg_url http://mirrors.kernel.org/ubuntu/pool/universe/r/rust-exa/exa_0.9.0-4_amd64.deb
# wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb; sudo dpkg -i ./lsd_0.20.1_amd64.deb; rm lsd_0.20.1_amd64.deb
dpkg_url https://github.com/muesli/duf/releases/download/v0.6.2/duf_0.6.2_linux_amd64.deb
dpkg_url https://github.com/ClementTsang/bottom/releases/download/0.6.1/bottom_0.6.1_amd64.deb
#https://github.com/dandavison/delta/releases/download/0.8.0/delta-0.8.0-x86_64-unknown-linux-gnu.tar.gz

