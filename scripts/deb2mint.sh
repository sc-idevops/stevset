#!/bin/bash
# this script enables mx repos and installs the default metapackages for mxlinux

# Step 1: Install keyrings
wget https://mirror.cs.jmu.edu/pub/linuxmint/packages/pool/main/l/linuxmint-keyring/linuxmint-keyring_2022.06.21_all.deb
sudo apt install ./linuxmint-keyring_2022.06.21_all.deb
rm linuxmint-keyring_2022.06.21_all.deb

# Step 2: Setup Sources List
echo "deb https://mirror.cs.jmu.edu/pub/linuxmint/packages gigi main upstream import backport" | sudo tee /etc/apt/sources.list.d/mint.sources

# Step 3: Update Sources and Install Keychain
sudo apt update && sudo apt install linuxmint-keyring

# Step 4: Install Desktop Environment
sudo apt remove xapp-sn-watcher libxapp-gtk3-module && sudo apt --fix-broken install mint-meta-cinnamon mint-meta-core
