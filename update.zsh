#!/bin/zsh
#delete current zsh config
ln -s ~/stevset/prezto/.zprezto ~/.zprezto
./udeps.sh
./prezto.zsh
