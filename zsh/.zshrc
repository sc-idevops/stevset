# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zplug/init.zsh

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
#zplug "junegunn/fzf-bin", \
 #   from:gh-r, \
  #  as:command, \
   # rename-to:fzf, \
    #use:"*darwin*amd64*"

#Github Plugins
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
#zplug "wookayin/fzf-fasd"
zplug "romkatv/powerlevel10k", as:theme, depth:1
# Supports oh-my-zsh plugins and the like
zplug "plugins/git", from:oh-my-zsh

# Also prezto
zplug "modules/environment", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/colorize", from:prezto
zplug "modules/spectrum", from:prezto

zplug "modules/archive", from:prezto
zplug "modules/docker", from:prezto
zplug "modules/dpkg", from:prezto
zplug "modules/python", from:prezto
zplug "modules/ssh", from:prezto
zplug "modules/tmux", from:prezto

zplug "modules/prompt", from:prezto

# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Can manage local plugins
zplug "~/.zsh", from:local

#Self Manage
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize
