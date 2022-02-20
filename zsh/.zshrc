# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load zgenom
source "${HOME}/.zgenom/zgenom.zsh"

# Check for plugin and zgenom updates every 7 days
# This does not increase the startup time.
zgenom autoupdate

# if the init script doesn't exist
if ! zgenom saved; then
    echo "Creating a zgenom save"

    # Add this if you experience issues with missing completions or errors mentioning compdef.
    # zgenom compdef

    # Ohmyzsh base library
    zgenom ohmyzsh

    # You can also cherry pick just parts of the base library.
    # Not loading the base set of ohmyzsh libraries might lead to issues.
    # While you can do it, I won't recommend it unless you know how to fix
    # those issues yourself.

    # Remove `zgenom ohmyzsh` and load parts of ohmyzsh like this:
    # `zgenom ohmyzsh path/to/file.zsh`
    # zgenom ohmyzsh lib/git.zsh # load git library of ohmyzsh

    # plugins
    zgenom ohmyzsh plugins/git
    zgenom ohmyzsh plugins/sudo
    # just load the completions
    zgenom ohmyzsh --completion plugins/docker-compose

    # prezto options
    zgenom prezto editor key-bindings 'vi'
    zgenom prezto prompt theme 'powerlevel10k'

    # prezto and modules
    # If you use prezto and ohmyzsh - load ohmyzsh first.
    zgenom prezto
    zgenom prezto command-not-found

    # Load prezto tmux when tmux is installed
    if hash tmux &>/dev/null; then
        zgenom prezto tmux
    fi

    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load zsh-users/zsh-history-substring-search

    # completions
    zgenom load zsh-users/zsh-completions

    # save all to init script
    zgenom save

    # Compile your zsh files
    zgenom compile "$HOME/.zshrc"
    zgenom compile $ZDOTDIR

    # You can perform other "time consuming" maintenance tasks here as well.
    # If you use `zgenom autoupdate` you're making sure it gets
    # executed every 7 days.

    # rbenv rehash
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
