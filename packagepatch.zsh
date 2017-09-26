cp package.patch /home/stev/.emacs.d/layers/+themes/themes-megapack/
cd /home/`whoami`/.emacs.d/layers/+themes/themes-megapack
patch < package.patch
rm package.patch
