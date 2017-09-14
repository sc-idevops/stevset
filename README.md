# Dotfile Repo
This repo contains all of my personal settings for command line linux programs.
Including but not limited to:
* zsh
* tmux
* vim
Also included are any custom shell scripts I might find useful to carry around with me.

# vim
my text editor of choice for its efficiency in keeping your hands as close to the home row as possible.

# tmux
a modern terminal multiplexor which is actively maintained compared to screen. Biggest modification is rebinding the leader key combo to Ctrl+A

# ZSH
I chose the Z shell for its extensive expansion and bonus features compared to the default bash shell.

## Plugin Managers
### Vundle
An expansion of the original pathogen plugin manager, this will automatically update git repos for plugins based on what's in the vimrc file

### Antibody
This plugin manager downloads zsh plugins directly from git based on a list of gituser/gitproject names in my .zshrc file. I chose it over antigen as it is more simple and quick.

## Powerline
Nifty modern looking effect for zsh, vim, and tmux!
