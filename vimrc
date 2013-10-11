set nohidden
set nowrap
"set copyindent
set autoindent
"set cindent
set smartindent
set expandtab
set softtabstop=2
set shiftwidth=2
set number
set background=dark
set pastetoggle=<F2> "Key to change in and out of paste mode
set backspace=2
syntax enable

"Command configs
nnoremap ; :
nnoremap <space> <Nop>
let mapleader = " " "This makes space to be your map leader
"Instead of typing :/<command> you type ; <command>
"Remove trailing whitespace when saving
autocmd BufWritePre * :%s/\s\+$//e

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
map <leader>[ gT
map <leader>] gt
map 0 ^
