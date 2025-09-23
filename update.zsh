#! /bin/zsh
sed -i '/history-incremental-search-backward/s/^/# /' $HOME/.zprezto/contrib/zsh-vi-mode/zsh-vi-mode.zsh
sed -i '/history-incremental-search-forward/s/^/# /' $HOME/.zprezto/contrib/zsh-vi-mode/zsh-vi-mode.zsh
stow --dotfiles config
