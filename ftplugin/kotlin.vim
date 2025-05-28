call plug#begin()
Plug 'Lokaltog/vim-easymotion'
Plug 'udalov/kotlin-vim'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

set expandtab
set tabstop=2
set shiftwidth=2
" set tags=$HOME/ctags/java/tags

setlocal completefunc=youcompleteme#Complete
setlocal completeopt=preview,menuone

" ctags bindings
nmap F :YcmComplete GoTo<CR>
map T <C-o>

let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector
