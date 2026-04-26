#!/bin/bash
#install vivaldi
wget https://downloads.vivaldi.com/stable/vivaldi-stable_7.9.3970.59-1_amd64.deb
sudo apt install ./vivaldi-stable_7.9.3970.59-1_amd64.deb
#clipboard manager
sudo apt install gir1.2-gda-5.0 gir1.2-gsound-1.0
open https://extensions.gnome.org/extension/8834/copyous/

#manual changes
echo "remember to do the following:"
echo " - fix the touchpad scrolling"
echo " - adjust dock clock to AM/PM + seconds"
