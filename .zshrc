# Set ZSH_CACHE_DIR to the path where cache files should be created
# or else we will use the default cache/
 if [[ -z "$ZSH_CACHE_DIR" ]]; then
   ZSH_CACHE_DIR="$ZSH/cache"
   fi

export TERM="xterm-256color"
#zsh options
setopt  auto_cd
setopt  complete_aliases
setopt  extended_glob
setopt  list_types
setopt  mark_dirs
setopt  path_dirs
setopt  prompt_subst
setopt  nonomatch
setopt  automenu

#Load libraries
for f in ~/.zsh/*.zsh; do
	source $f
done

#alias/prefs
export VISUAL="/usr/bin/vim"
export EDITOR="$VISUAL"
alias tmux="tmux -2"
autoload -U compinit && compinit
zstyle ':completion:*' menu select

#source /usr/share/autojump/autojump.sh

#init powerline
. /usr/share/powerline/bindings/zsh/powerline.zsh

#Antibody Init
source <(antibody init)
#antibody bundles
antibody bundle bhilburn/powerlevel9k
antibody bundle chrissicool/zsh-256color
antibody bundle zlsun/solarized-man
antibody bundle zdharma/history-search-multi-word
antibody bundle Vifon/deer

antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-syntax-highlighting

#Plugin Settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
