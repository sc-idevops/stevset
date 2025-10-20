#!/bin/bash
#These are the programs I expect to find on any install
function dpkg_url() {
  local tmp_deb="$(mktemp)"
  local src_url=$1
  local args=${@:2}

  wget -q --show-progress -O $tmp_deb $src_url &&
    sudo dpkg -i $tmp_deb $args &&
    {
      rm -f $tmp_deb
      true
    } || # commands above succeeded, remove tmp file
    {
      rm -f $tmp_deb
      false
    } # commands above failed, remove tmp file anyway
}

# installing base dependencies
sudo apt -my install \
  ack \
  aptitude \
  curl \
  duf \
  etckeeper \
  fzf \
  git \
  git-delta \
  grc \
  htop \
  lua5.1 \
  luarocks \
  mailutils \
  make \
  mc \
  mutt \
  nala \
  ncdu \
  nnn \
  powerline \
  ripgrep \
  stow \
  tmux \
  trash-cli \
  tree \
  tree-sitter-cli \
  vim \
  wl-clipboard \
  wget \
  xclip \
  zsh

read -n1 -p $'\nDoes this system need a ssh server?\n' REPLY
if [[ $REPLY == [Yy] ]]; then
  sudo apt-get install openssh-server fail2ban
  trash ~/.zshrc_prelocal
fi
read -n1 -p $'\nDoes this system have a GUI?\n' REPLY
if [[ $REPLY == [Yy] ]]; then
  sudo apt-get install synaptic flatpak
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi

#setup git-delta
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3

#This section installs software outside apt
read -n1 -p $'\nDownload external packages?\n' REPLY
if [[ $REPLY == [Yy] ]]; then
  dpkg_url https://github.com/bootandy/dust/releases/download/v1.2.3/du-dust_1.2.3-1_amd64.deb
  dpkg_url https://github.com/charmbracelet/glow/releases/download/v2.1.1/glow_2.1.1_amd64.deb
  dpkg_url https://github.com/ClementTsang/bottom/releases/download/0.11.1/bottom_0.11.1-1_amd64.deb
  dpkg_url https://github.com/sharkdp/bat/releases/download/v0.26.0/bat_0.26.0_amd64.tmp_deb
  dpkg_url https://github.com/sharkdp/fd/releases/download/v10.3.0/fd_10.3.0_amd64.deb

  echo "Install lazygit"
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit -D -t /usr/local/bin/
  trash lazygit lazygit.tar.gz
fi

#script to link to stevserver over LAN. Note: the username in the filename and file have to match yours.
echo -n "Will you need to connect to stev-server?"
read -r answer
if [[ $answer == [Yy] ]]; then
  sudo apt install nfs-common
  cat <<EOF | sudo tee -a /etc/systemd/system/home-$USER-server.mount
[Unit]
Description=Automatically Mount Stev-Server NFS Share
After=network-online.target
Wants=network-online.target

[Mount]
What=192.168.1.147:/home/stev
Where=/home/$USER/server
Type=nfs
Options=auto,nofail,noatime

[Install]
WantedBy=remote-fs.target
EOF
  sudo systemctl daemon-reload
  sudo systemctl enable --now home-$USER-server.mount
fi
