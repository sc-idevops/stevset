#!/bin/bash
help() {
      echo "Usage: $(basename $0) 
      [-e] Installs Firefox ESR 
      [-f] Installs Flatpak Firefox
      [-d] Installs Firefox from the official Mozilla Repo and Pins it's Priority in apt
      [-p] Purges the Snapd daemon from the system. Use if you don't want snaps anymore period."
      exit 1
}

if [ -z "$*" ]; then help; fi

#process flags
while getopts 'efrp:h' opt; do
  case "$opt" in
    e)
      echo "Installing Firefox ESR"
      sudo add-apt-repository ppa:mozillateam/ppa
      sudo apt-get update
      sudo apt-get -y remove firefox
      sudo snap remove firefox
      echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
      sudo apt-get -y install firefox-esr
      ;;

    f)
      echo "Installing Flatpak Firefox"
      sudo apt-get -y install flatpak
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      flatpak install flathub org.mozilla.firefox
      ;;

    d)
      echo "Installing Firefox from Offical Mozilla Repo"
      #Create an APT keyring (if one doesn’t already exist):
      sudo install -d -m 0755 /etc/apt/keyrings
      wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
      echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
      echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
      ' | sudo tee /etc/apt/preferences.d/mozilla
      sudo apt update && sudo apt install firefox
      ;;

    p)
      echo "Purging snapd..."
      sudo apt-get autoremove snapd
      ;;

    r)
      echo "Purging Firefox Snap"
      echo "Backing up Snap Profile"
      cp -r ~/snap/firefox/current ~/mozilla_backup
      sudo snap remove firefox
      ;;

    *)
      help
      ;;
  esac
done
shift "$(($OPTIND -1))"

 
