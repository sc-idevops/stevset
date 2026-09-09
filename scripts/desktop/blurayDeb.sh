#!/bin/bash
# This script adds the default apt repos after installing debian from the bluray ISO

echo "
Types: deb deb-src
URIs: http://deb.debian.org/debian
Suites: trixie trixie-updates trixie-backports
Components: main non-free-firmware contrib non-free
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg

Types: deb
URIs: http://security.debian.org/debian-security/
Suites: trixie-security
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
" | sudo tee /etc/apt/sources.list.d/debian.sources

sudo apt update
