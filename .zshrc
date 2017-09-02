export TERM="xterm-256color"
#zsh options
setopt  auto_cd
setopt  complete_aliases
setopt  extended_glob
setopt  hist_ignore_all_dups
setopt  share_history
setopt  list_types
setopt  mark_dirs
setopt  path_dirs

#alias/prefs
export VISUAL="/usr/bin/vim"
export EDITOR="$VISUAL"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'
alias tmux="tmux -2"
source ~/.aliases.zsh

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
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#if [[ -n "$SSH_CLIENT" ]]
#then
#	ZSH_THEME="bureau"
#else
#	ZSH_THEME="agnoster"
#fi
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
  HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(colored-man-pages copydir cp fasd git gitignore jump systemd tmux vi-mode zsh-autosuggestions)


#Set caps to escape when tapped and ctrl when held
#if [[ -n "$SSH_CLIENT" ]]
#	then
#		setxkbmap -option 'caps:ctrl_modifier'
#		xcape -e 'Caps_Lock=Escape'
#	fi
