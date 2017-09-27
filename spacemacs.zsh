ln -s /home/`whoami`/stevset/.spacemacs /home/`whoami`/.spacemacs
#init spacemacs in the background
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

#Patch theme file to squelch error messages
cp package.patch /home/stev/.emacs.d/layers/+themes/themes-megapack/
cd /home/`whoami`/.emacs.d/layers/+themes/themes-megapack
patch < package.patch
rm package.patch
