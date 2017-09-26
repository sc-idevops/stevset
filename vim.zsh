#init vim and plugins
git submodule init
git submodule update
vim +PluginInstall! +qall
mv ~/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-clvv-SLASH-fasd/fasd ~/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-clvv-SLASH-fasd/fasd.zsh
