set nohidden
set nowrap
"set copyindent
set autoindent
"set cindent
set smartindent
set noexpandtab
set softtabstop=2
set shiftwidth=2
set number
set background=dark
set pastetoggle=<F2> "Key to change in and out of paste mode
set backspace=2
syntax enable
filetype plugin on
filetype indent on

"Command configs
nnoremap ; :
nnoremap <space> <Nop>
let mapleader = " " "This makes space to be your map leader
"Instead of typing :/<command> you type ; <command>

"Searching
set ignorecase
set hlsearch
set incsearch

"Outdated stuff off
set nobackup
set noswapfile

"Return removes highlighting from searches
nnoremap <CR> :noh<CR><CR>

"Tabbing config
let g:ctrlp_map='\'
map T :tabnew<space>
map Q :tabclose<CR>
map ` :NERDTreeToggle<CR>
map [ gT
map ] gt
map 0 ^

"Column limit
"Must go at the end due to highlight will be overwritten
"if colorscheme is used
set colorcolumn=+1
highlight ColorColumn ctermbg=red guibg=lightgrey
set colorcolumn=80

"Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'faith/vim-go'
