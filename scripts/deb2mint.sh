#!/bin/bash
# this script enables mx repos and installs the default metapackages for mxlinux

# Step 1: Install keyrings
echo "deb https://mirror.cs.jmu.edu/pub/linuxmint/packages gigi main upstream import backport"
 | sudo tee > /etc/apt/sources.list.d/mint.sources
sudo apt update && sudo apt install linuxmint-keyring

