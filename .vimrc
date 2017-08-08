" => General
execute pathogen#infect()
set history=500
set number
syntax enable
set t_Co=256
set background=dark
colorscheme solarized
" Enable filetype plugins
filetype plugin on
filetype indent on
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
" => VIM user interface
" Turn on the WiLd menu
set wildmenu
"Always show current position
set ruler

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
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

