#!/bin/zsh
#Update external packages

function dpkg_url() {
  local tmp_deb="$(mktemp)"
  local src_url=$1
  local args=${@:2}

  wget -q --show-progress -O $tmp_deb $src_url &&
  sudo dpkg -i $tmp_deb $args &&
  { rm -f $tmp_deb; true; } || # commands above succeeded, remove tmp file
  { rm -f $tmp_deb; false; }   # commands above failed, remove tmp file anyway
}
dpkg_url https://github.com/muesli/duf/releases/download/v0.6.2/duf_0.6.2_linux_amd64.deb
dpkg_url https://github.com/ClementTsang/bottom/releases/download/0.6.3/bottom_0.6.3_amd64.deb
dpkg_url https://github.com/dandavison/delta/releases/download/0.8.3/git-delta_0.8.3_amd64.deb

#Link new bottom config
rm ~/.config/bottom/bottom.toml
ln -s ~/stevset/config/bottom/bottom.toml ~/.config/bottom
