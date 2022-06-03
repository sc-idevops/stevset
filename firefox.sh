#!/bin/bash
add_ppa() {
  sudo add-apt-repository ppa:mozillateam/ppa
  sudo apt update
  sudo apt remove firefox
  echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
}

#process flags
while getopts 'efrp:h' opt; do
  case "$opt" in
    e)
      echo "Installing Firefox ESR"
      add_ppa
      sudo snap remove firefox
      sudo apt install firefox-esr
      ;;

    f)
      echo "Installing Flatpak Firefox"
      sudo snap remove firefox
      sudo apt install flatpak
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      flatpak install flathub org.mozilla.firefox
      ;;

    r)
      echo "Installing Regular Firefox"
      add_ppa
      sudo snap remove firefox
      sudo apt install -t 'o=LP-PPA-mozillateam' firefox
      #Pin Priority
      echo 'Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
      ' | sudo tee /etc/apt/preferences.d/mozilla-firefox
      ;;

    p)
      echo "Purging snapd..."
      sudo apt autoremove snapd
      ;;

    ?|h)
      echo "Usage: $(basename $0) 
      [-e] Installs Firefox ESR 
      [-f] Installs Flatpak Firefox
      [-r] Installs regular Firefox and Pins It's Priority
      [-p] Purges the Snapd daemon from the system. Use if you don't want snaps anymore period."
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

 
