[ -d $HOME/server ] || mkdir $HOME/server
sudo mount -t nfs 192.168.1.147:/home/stev $HOME/server
