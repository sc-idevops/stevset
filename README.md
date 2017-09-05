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

### Pathogen
This plugin manager automatically loads all of my vim plugins in the .vim/bundle directory. All I need to do is add one line to my .vimrc for this functionality.

### Antibody
This plugin manager downloads zsh plugins directly from git based on a list of gituser/gitproject names in my .zshrc file. I chose it over antigen as it is more simple and quick.

## Powerline
Nifty modern looking effect for zsh, vim, and tmux!
