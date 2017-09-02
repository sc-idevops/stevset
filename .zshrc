export TERM="xterm-256color"
#zsh options
setopt  auto_cd
setopt  complete_aliases
setopt  extended_glob
#setopt  hist_ignore_all_dups
setopt  share_history
setopt  list_types
setopt  mark_dirs
setopt  path_dirs

#alias/prefs
export VISUAL="/usr/bin/vim"
export EDITOR="$VISUAL"
alias tmux="tmux -2"
source ~/.aliases.zsh
#source /usr/share/autojump/autojump.sh

#init powerline
. /usr/share/powerline/bindings/zsh/powerline.zsh

#Antibody Init
source <(antibody init)
#antibody bundles
antibody bundle bhilburn/powerlevel9k
antibody bundle chrissicool/zsh-256color
antibody bundle zlsun/solarized-man

antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-syntax-highlighting

#Plugin Settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
