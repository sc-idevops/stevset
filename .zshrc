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

#History settings
if [ -z "$HISTFILE" ]; then
	    HISTFILE=$HOME/.zsh_history
    fi

    HISTSIZE=10000
    SAVEHIST=10000

    # Show history
     case $HIST_STAMPS in
       "mm/dd/yyyy") alias history='fc -fl 1' ;;
         "dd.mm.yyyy") alias history='fc -El 1' ;;
           "yyyy-mm-dd") alias history='fc -il 1' ;;
             *) alias history='fc -l 1' ;;
             esac
    
             setopt append_history
             setopt extended_history
             setopt hist_expire_dups_first
             setopt hist_ignore_dups # ignore duplication command history list
             setopt hist_ignore_space
             setopt hist_verify
             setopt inc_append_history
             setopt share_history # share command history data
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
