#This will finally fix this problem
echo "cloning emoji.conf"
git clone https://gitlab.com/es20490446e/emoji.conf.git
cd emoji.conf
./install-uninstall.sh
cd ..
rm -rf emoji.conf
#test by going to https://www.fileformat.info/info/emoji/browsertest.htm
echo "regenerating font cache"
fc-cache -f -v
