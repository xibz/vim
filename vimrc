""""""""""""""""""""""""""""""""""""""""""
"		Plugins			 "
""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin()
Plug 'Lokaltog/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-signify'
call plug#end()

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
set encoding=utf-8

" quick update for git diff
set updatetime=100
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
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

map T :tabnew<space>
map Q :tabclose<CR>
map ` :NERDTreeToggle<CR>

" ctags bindings
map F <C-]>
map T <C-t>

map 0 ^
nmap s <Plug>(easymotion-s)

" autocomplete stuff
" remap ctrl-x to automatically open autocomplete window and option
inoremap <C-x> <C-X><C-O>
" map ctrl-o to toggle between autocomplete options
inoremap <C-o> <C-O>

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

let g:ycm_filepath_blacklist = {
      \ 'html': 1,
      \ 'jsx': 1,
      \ 'xml': 1,
      \}

" makes ctrlp significantly faster by ignoring files in .git and files in
" .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" enable tab completion for deoplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

setlocal completefunc=youcompleteme#Complete
setlocal completeopt=preview,menuone

au! BufRead,BufNewFile *.pcl setfiletype pcl
au! BufRead,BufNewFile *.gradle setfiletype gradle
