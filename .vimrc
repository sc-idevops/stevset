" => Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'
Plugin 'ajh17/VimCompletesMe'
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" => Appearance
set t_Co=256
set background=dark
let g:solarized_contrast="high"    "default value is normal
let g:solarized_visibility="high"    "default value is normal
colorscheme solarized
set number
" below is from https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
" see examples at https://github.com/bluz71/dotfiles/blob/master/vimrc
"set breakindent
"set showbreak=\\\\\
set relativenumber
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
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
"paste from outside buffer
nnoremap <leader>p :set paste<CR>"+p:set nopaste<CR>
vnoremap <leader>p <Esc>:set paste<CR>gv"+p:set nopaste<CR>
""copy to outside buffer
vnoremap <leader>y "+y
"select all
nnoremap <leader>a ggVG
""paste from 0 register
"Useful because `d` overwrites the <quote> register
nnoremap <leader>P "0p
vnoremap <leader>P "0p

"=> Leader
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" => airline Config
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

" markdown also starts with .md
autocmd BufNewFile,BufRead *.md set filetype=markdown

set nrformats-=octal
