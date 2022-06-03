#!/bin/bash
sudo add-apt-repository ppa:mozillateam/ppa
sudo apt update
sudo snap remove firefox
sudo apt remove firefox

#process flags
while getopts 'efrp:h' opt; do
  case "$opt" in
    e)
      echo "Installing Firefox ESR"
      sudo apt install firefox-esr
      echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
      ;;

    f)
      echo "Installing Flatpak Firefox"
      sudo apt install flatpak
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      flatpak install flathub org.mozilla.firefox
      ;;

    r)
      echo "Installing Regular Firefox"
      sudo apt install -t 'o=LP-PPA-mozillateam' firefox
      #Pin Priority
      echo '
      Package: *
      Pin: release o=LP-PPA-mozillateam
      Pin-Priority: 1001
      ' | sudo tee /etc/apt/preferences.d/mozilla-firefox
      echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
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

 
