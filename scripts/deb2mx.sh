#!/bin/bash
# this script enables mx repos and installs the default metapackages for mxlinux

wget https://mirror.math.princeton.edu/pub/mxlinux/mx/repo/pool/main/m/mx25-archive-keyring/mx25-archive-keyring_2025.03_all.deb
sudo apt install -y ./mx25-archive-keyring_2025.03_all.deb
echo "Types: deb
URIs: http://mirror.math.princeton.edu/pub/mxlinux/mx/repo/
Suites: trixie
Components: ahs
Signed-By: /usr/share/keyrings/mx-25-archive-keyring.gpg 

Types: deb
Enabled: no
URIs: http://mirror.math.princeton.edu/pub/mxlinux/mx/testrepo/
Suites: trixie
Components: test
Signed-By: /usr/share/keyrings/mx-25-archive-keyring.gpg 

Types: deb
URIs: http://mirror.math.princeton.edu/pub/mxlinux/mx/repo/
Suites: trixie
Components: main non-free
Signed-By: /usr/share/keyrings/mx-25-archive-keyring.gpg 
"
 | sudo tee > /etc/apt/sources.list.d/mx.sources

sudo apt update && sudo apt install mx-apps-kde desktop-defaults-mx-kde