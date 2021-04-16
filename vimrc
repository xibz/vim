""""""""""""""""""""""""""""""""""""""""""
"		Plugins			 "
""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
call vundle#end()

filetype plugin on
filetype plugin indent on
filetype indent on
""""""""""""""""""""""""""""""""""""""""""

set nohidden
set nowrap
set autoindent
set smartindent
set number
set background=dark
set pastetoggle=<F2> "Key to change in and out of paste mode
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

" Navigation of a single pane
nmap - <C-b>
nmap = <C-d>

" Return removes highlighting from searches
nnoremap <CR> :noh<CR><CR>

let g:ctrlp_map='\'
map T :tabnew<space>
map Q :tabclose<CR>
map ` :NERDTreeToggle<CR>

" Panes navigation
map + <C-W>k
map " <C-W>j
map { <C-W>h
map } <C-W>l

map 0 ^
nmap s <Plug>(easymotion-s)

" git-gutter bindings
map _ :GitGutterToggle<CR>

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

execute pathogen#infect()
call pathogen#helptags()

let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_linenrs = 1

" makes ctrlp significantly faster by ignoring files in .git and files in
" .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" enable tab completion for deoplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
