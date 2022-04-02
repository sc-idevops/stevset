#Installs programs I use on a personal desktop that aren't part of the usual repositories
#Telegram, Discord, Guilded
function dpkg_url() {
  local tmp_deb="$(mktemp)"
  local src_url=$1
  local args=${@:2}

  wget -O $tmp_deb $src_url &&
  sudo dpkg -i $tmp_deb $args &&
  { rm -f $tmp_deb; true; } || # commands above succeeded, remove tmp file
  { rm -f $tmp_deb; false; }   # commands above failed, remove tmp file anyway
}

wget https://telegram.org/dl/desktop/linux -O ~/Downloads/tsetup.tar.xz
  extract tsetup.tar.xz
dpkg_url https://discord.com/api/download?platform=linux&format=deb
#dpkg_url https://www.guilded.gg/downloads/Guilded-Linux.deb
