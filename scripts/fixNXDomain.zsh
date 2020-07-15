echo "relinking resolv.conf"
sudo mv /etc/resolv.conf /etc/resolv.conf.bak
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
