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
  git \
  vim \
  stow \
  etckeeper \
  tmux \
  zsh \
  powerline htop \
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
  trash-cli \
  nala \
  libfuse2 \
  make \
  shellcheck \
  lua5.1

release=$(lsb_release -cs)
if [[ $release == jammy || $release == noble ]]; then
  sudo apt install \
    bat \
    duf \
    btop
fi

read -n1 -p $'Does this system need a ssh server?\n' REPLY
if [[ $REPLY == [Yy] ]]; then
  sudo apt install openssh-server fail2ban
fi
read -n1 -p $'\nDoes this system have a GUI?\n' REPLY
if [[ $REPLY == [Yy] ]]; then
  sudo apt install synaptic flatpak
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi

#This section installs software outside apt
dpkg_url https://github.com/dandavison/delta/releases/download/0.18.2/git-delta_0.18.2_amd64.deb
dpkg_url https://github.com/bootandy/dust/releases/download/v1.1.2/du-dust_1.1.2-1_amd64.deb
dpkg_url https://github.com/charmbracelet/glow/releases/download/v2.1.0/glow_2.1.0_amd64.deb
dpkg_url https://github.com/ClementTsang/bottom/releases/download/0.10.2/bottom_0.10.2-1_amd64.deb

echo "Install lazygit"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
