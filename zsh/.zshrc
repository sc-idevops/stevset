#Original Concept located from https://github.com/crivotz/dot_files/blob/master/linux/zplugin/zshrc
# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1
#####################
# FIRST PROMPT LINE #
#####################
rosso='\e[1;34m'
NC='\e[0m'
echo -e "${rosso}Ubuntu${NC}" `lsb_release -sr` "| ${rosso}ZSH${NC} ${ZSH_VERSION}"
#####################
# ZINIT             #
#####################
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p $HOME/.zinit
    command git clone https://github.com/zdharma/zinit $HOME/.zinit/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk
zinit light willghatch/zsh-saneopt
#####################
# THEME             #
#####################
zinit ice depth=1; zinit light romkatv/powerlevel10k
# Uncomment following line if you want red dots to be displayed while waiting for completion
export COMPLETION_WAITING_DOTS="true"

#####################
# PREZTO
#####################

zstyle ':prezto:*:*' case-sensitive 'no'
zstyle ':prezto:*:*' color 'yes'

zinit ice silent; zinit snippet PZT::modules/gpg
zstyle :omz:plugins:ssh-agent identities id_rsa github_rsa pete_rsa stevserver_rsa ymca_rsa
# Auto convert .... to ../..
zstyle ':prezto:module:editor' dot-expansion 'yes'

zinit wait lucid for \
  OMZ::plugins/common-aliases \
  if"[[ $+commands[systemd] ]]" OMZ::plugins/systemd \
  hkupty/ssh-agent \
  PZT::modules/helper/init.zsh \
  PZT::modules/environment/init.zsh  \
  PZT::modules/terminal/init.zsh  \
  PZT::modules/editor/init.zsh \
  PZT::modules/history/init.zsh \
  PZT::modules/directory/init.zsh \
  PZT::modules/spectrum/init.zsh 
  # PZT::modules/utility/init.zsh
#####################
# PLUGINS           #
#####################
# tmux {{
zstyle ':prezto:module:tmux:session' name 'λ'
[[ -n $DISPLAY ]] && zstyle ':prezto:module:tmux:auto-start' local 'yes'
zstyle ':prezto:module:tmux:auto-start' remote 'yes'
zinit ice zinit snippet PZT::modules/tmux
# }}}
##Set VI MODE
bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
# Also fix annoying vi backspace
bindkey '^?' backward-delete-char
bindkey '^[b' vi-backward-blank-word
bindkey '^[w' vi-forward-blank-word
# SSH-AGENT
zinit light bobsoppe/zsh-ssh-agent
# AUTOSUGGESTIONS, TRIGGER PRECMD HOOK UPON LOAD
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
zinit ice wait"0a" lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
# ENHANCD
zinit ice wait"0b" lucid
zinit light b4b4r07/enhancd
export ENHANCD_FILTER=fzf:fzy:peco
# HISTORY SUBSTRING SEARCHING
zinit ice wait"0b" lucid atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# TAB COMPLETIONS
zinit ice wait"0b" lucid blockf
zinit light zsh-users/zsh-completions
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '-- %d --'
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:complete:*:options' sort false
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Magic Generate Completions
GENCOMPL_FPATH=$HOME/.cache/zsh-completion-generator
GENCOMPL_PY=python3
if [ ! -d "$GENCOMPL_FPATH" ]; then
    mkdir -p $GENCOMPL_FPATH
fi
fpath=($GENCOMPL_FPATH $fpath)
zstyle :plugin:zsh-completion-generator programs fzf
zinit wait'3' lucid for RobSis/zsh-completion-generator
# FZF
zinit ice from"gh-r" as"command"
zinit light junegunn/fzf
# FZF BYNARY AND TMUX HELPER SCRIPT
zinit ice lucid wait'0c' as"command" id-as"junegunn/fzf-tmux" pick"bin/fzf-tmux"
zinit light junegunn/fzf
# BIND MULTIPLE WIDGETS USING FZF
zinit ice lucid wait'0c' multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null"
zinit light junegunn/fzf
# FZF-TAB
zinit ice wait"1" lucid
zinit light Aloxaf/fzf-tab
# SYNTAX HIGHLIGHTING
zinit ice wait"0c" lucid atinit"zpcompinit;zpcdreplay"
zinit light zdharma/fast-syntax-highlighting
# EXA
zinit ice wait"2" lucid from"gh-r" as"program" mv"bin/exa* -> exa"
zinit light ogham/exa
zinit ice wait blockf atpull'zinit creinstall -q .'
# DELTA
zinit ice lucid wait"0" as"program" from"gh-r" pick"delta*/delta"
zinit light 'dandavison/delta'
# BAT
zinit ice from"gh-r" as"program" mv"bat* -> bat" pick"bat/bat" atload"alias cat=bat"
zinit light sharkdp/bat
# BAT-EXTRAS
zinit ice wait"1" as"program" pick"src/batgrep.sh" lucid
zinit ice wait"1" as"program" pick"src/batdiff.sh" lucid
zinit light eth-p/bat-extras
alias rg=batgrep.sh
alias bd=batdiff.sh
alias man=batman.sh
# RIPGREP
zinit ice from"gh-r" as"program" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zinit light BurntSushi/ripgrep
# NEOVIM
#zinit ice from"gh-r" as"program" bpick"*appimage*" ver"nightly" mv"nvim* -> nvim" pick"nvim"
#zinit light neovim/neovim
# FORGIT
zinit ice wait lucid
zinit load 'wfxr/forgit'
# LAZYGIT
zinit ice lucid wait"0" as"program" from"gh-r" mv"lazygit* -> lazygit" atload"alias lg='lazygit'"
zinit light 'jesseduffield/lazygit'
# RANGER
# zinit ice depth'1' as"program" pick"ranger.py"
# zinit light ranger/ranger
# FD
zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd
# GH-CLI
zinit ice lucid wait"0" as"program" from"gh-r" pick"usr/bin/gh"
zinit light "cli/cli"
# TREE-SITTER
zinit ice as"program" from"gh-r" mv"tree* -> tree-sitter" pick"tree-sitter"
zinit light tree-sitter/tree-sitter
# Zsh AutoSuggestions
zstyle -s ':prezto:module:autosuggestions:color' found \
    'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE' || ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
# XURLS
#zinit ice as"program" from"gh-r" mv"xurls* -> xurls" pick"xurls"
#zinit light mvdan/xurls
# PRETTYPING
zinit ice lucid wait'' as"program" pick"prettyping" atload'alias ping=prettyping'
zinit load "denilsonsa/prettyping"
#####################
# HISTORY           #
#####################
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=290000
SAVEHIST=$HISTSIZE

#####################
# SETOPT            #
#####################
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
# setopt completealiases        # complete alisases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect                # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu
unsetopt BEEP
# From Prezto/Environment
unsetopt BG_NICE          # Don't run all background jobs at a lower priority.
unsetopt HUP              # Don't kill jobs on shell exit.
unsetopt CHECK_JOBS       # Don't report on jobs when shell exit.

# chpwd() exa --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale
#####################
# ENV VARIABLE      #
#####################
export EDITOR='vim'
export VISUAL=$EDITOR
export PAGER='less'

#####################
# COLORING          #
#####################
autoload colors && colors

#####################
# ALIASES           #
#####################
source $HOME/.zsh_aliases

#####################
# FANCY-CTRL-Z      #
#####################
function fg-fzf() {
	job="$(jobs | fzf -0 -1 | sed -E 's/\[(.+)\].*/\1/')" && echo '' && fg %$job
}

function fancy-ctrl-z () {
	if [[ $#BUFFER -eq 0 ]]; then
		BUFFER=" fg-fzf"
		zle accept-line -w
	else
		zle push-input -w
		zle clear-screen -w
	fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

#####################
# FZF SETTINGS      #
#####################
export FZF_DEFAULT_OPTS="
--ansi
--layout=default
--info=inline
--height=50%
--multi
--preview-window=right:50%
--preview-window=sharp
--preview-window=cycle
--preview '([[ -f {} ]] && (bat --style=numbers --color=always --theme=gruvbox-dark --line-range :500 {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--prompt='λ -> '
--pointer='|>'
--marker='✓'
--bind 'ctrl-e:execute(vim {} < /dev/tty > /dev/tty 2>&1)' > selected
--bind 'ctrl-v:execute(code {+})'"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#####################
# FZF-GC-PROJECT    #
#####################
# Thanks to sei40kr/zsh-fzf-gcloud

#function fzf-gcloud-config-set-project() {
#    local project="$(gcloud projects list |
#        fzf --header-lines=1 --reverse |
#        awk '{ print $1 }')"

#    if [[ -n "$project" ]]; then
#        gcloud config set project "$project"
#    fi
#}
#zle -N fzf-gcloud-config-set-project
#bindkey '^G' fzf-gcloud-config-set-project

#####################
# PATH              #
#####################
export PATH=$PATH:~/.local/bin:~/bin

#####################
# P10K SETTINGS     #
#####################
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

#####################
# RVM VARIABLE      #
#####################
#export PATH="$PATH:$HOME/.rvm/bin"
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
