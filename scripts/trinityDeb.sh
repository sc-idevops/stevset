#!/bin/bash
# This script sets up a trinity desktop environment with the palemoon browser for the best WinXP era experience!

echo "deb http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-r14.1.x trixie main deps" | sudo tee > /etc/apt/sources.list.d/trinity.list

# The MX Linux repo contains a deb for palemoon which we can use
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

wget https://mirror.math.princeton.edu/pub/mxlinux/mx/repo/pool/main/m/mx25-archive-keyring/mx25-archive-keyring_2025.03_all.deb
wget http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-keyring.deb

sudo apt install -y ./mx25-archive-keyring_2025.03_all.deb ./trinity-keyring.deb

sudo apt update && sudo apt install aptitude

sudo aptitude install tde-trinity palemoon