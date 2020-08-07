#!/bin/zsh
echo "Configuring Emoji Fonts"
git clone https://gitlab.com/es20490446e/emoji.conf.git
cd emoji.conf/
./install-uninstall.sh
#regenerate font cache
fc-cache -f -v
#cleanup
cd ..
rm -r emoji.conf
