" => Vundle
set nocompatible              " be iMproved, required

" Check if vim plug is already installed, if not clone it from github
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" init VimPlug
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
"Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'ajh17/VimCompletesMe'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call plug#end()

" => Appearance
set t_Co=256
set background=dark
"let g:solarized_contrast="high"    "default value is normal
"let g:solarized_visibility="high"    "default value is normal
colorscheme zenburn
set number
" Only blink cursor in insert mode
set guicursor+=n-v-c:blinkon0
" Highlight current line
set cursorline
" Show the current mode
set showmode
" below is from https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
" see examples at https://github.com/bluz71/dotfiles/blob/master/vimrc
"set breakindent
"set showbreak=\\\\\
"set relativenumber
set infercase
set synmaxcol=200

" => VIM user interface
" Wildmode is in sensible
set wildmode=full
" Height of the command bar
set cmdheight=2
" Highlight search results
set hlsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw 
" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

"=> Functions
set autowrite
set mouse=a

"=> Leader
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
"paste from outside buffer
nnoremap <leader>p :set paste<CR>"+p:set nopaste<CR>
vnoremap <leader>p <Esc>:set paste<CR>gv"+p:set nopaste<CR>
""copy to outside buffer
"" Allow paste to and from system clipboard with + register
set clipboard=unnamedplus

vnoremap <leader>y "+y
"select all

nnoremap <leader>a ggVG
""paste from 0 register
"Useful because `d` overwrites the <quote> register
nnoremap <leader>P "0p
vnoremap <leader>P "0p

" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" => airline Config
"let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

" markdown also starts with .md
autocmd BufNewFile,BufRead *.md set filetype=markdown

set nrformats-=octal

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*
