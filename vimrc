""""""""""""""""""""""""""""""""""""""""""
"		Plugins			 "
""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'fatih/vim-go'
Plugin 'Lokaltog/vim-easymotion'
call vundle#end()

filetype plugin on
filetype plugin indent on
filetype indent on
""""""""""""""""""""""""""""""""""""""""""

set nohidden
set nowrap
"set copyindent
set autoindent
"set cindent
set smartindent
set noexpandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set number
set background=dark
set pastetoggle=<F2> "Key to change in and out of paste mode
"set backspace=2
syntax enable

" Command configs
nnoremap ; :
nnoremap <space> <Nop>
let mapleader = " " "This makes space to be your map leader
"Instead of typing :/<command> you type ; <command>

" Searching
set ignorecase
set hlsearch
set incsearch

" Outdated stuff off
set nobackup
set noswapfile

" Toggle tabs
nnoremap H gT
nnoremap L gt

" Return removes highlighting from searches
nnoremap <CR> :noh<CR><CR>

let g:ctrlp_map='\'
map T :tabnew<space>
map Q :tabclose<CR>
map ` :NERDTreeToggle<CR>
map 0 ^
nmap s <Plug>(easymotion-s)
map " :split<CR>:GoDef<CR>

" Column limit
" Must go at the end due to highlight will be overwritten
" if colorscheme is used
set colorcolumn=+1
highlight ColorColumn ctermbg=red guibg=lightgrey
set colorcolumn=120

" Tab colors                                                                                                            
hi TabLineFill ctermfg=DarkGray ctermbg=LightGray                                                                       
hi TabLine ctermfg=DarkBlue ctermbg=LightGray                                                                           
hi TabLineSel ctermfg=White ctermbg=DarkGray 
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1

execute pathogen#infect()
call pathogen#helptags()
