call plug#begin()
Plug 'Lokaltog/vim-easymotion'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'ycm-core/YouCompleteMe'
Plug 'puremourning/vimspector'
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

autocmd! BufWritePost <buffer> YcmCompleter OrganizeImports

let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector
