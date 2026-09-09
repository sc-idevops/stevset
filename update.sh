#! /bin/bash
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

sudo apt autoremove tree-sitter-cli
