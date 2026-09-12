# Dotfile Repo
This repo contains all of my personal settings for command line linux programs.
They are conveniently stored in categorized folders, and automatically symlinked to the correct location in the home folder via a clever use of GNU Stow.
Including but not limited to:
* zsh
* tmux
* vim

Also included are any custom shell scripts I might find useful to carry around with me.

# vim -> neovim
my text editor of choice for its efficiency in keeping your hands as close to the home row as possible.

I now use lazyvim to have a tricked out neovim setup with minimal effort. 

# tmux
a modern terminal multiplexer which is actively maintained compared to screen. Biggest modification is rebinding the leader key combo to Ctrl+A

# zsh
I chose the Z shell for its extensive expansion and bonus features compared to the default bash shell.

I use p10k for my shell theme

## Plugin Managers
### Prezto
A lighter version of the popular oh-my-zsh, this provided a stable and tested place to start making my own shell modifications.

### lazyvim
a handy and optimized vim "distribution" with batteries included
learn more at [https://lazyvim-ambitious-devs.phillips.codes/course/chapter-1/](https://lazyvim-ambitious-devs.phillips.codes/course/chapter-1/)

## Powerline
Nifty modern looking effect for zsh, vim, and tmux!

# Custom setup

the deps folder contains scripts to install programs I use on different flavors of linux. the init script automatically detects and runs the appropriate command for the correct distro. 

as debian is now my preferred distro, i have several scripts to set up debian flavors that I like. 
* deb2mint makes a debian install into a linux mint debian edition 
* deb2mx makes a debian install into a mx linux edition
* deb2trinity makes a debian install into the retro trinity desktop based on kde3

the blueray deb script helps when I install from an ISO image and I forget to use an http mirror and need a sources.list 
