#!/bin/bash
# https://askubuntu.com/a/919096
echo options hid_apple swap_opt_cmd=1 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all
