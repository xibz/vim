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

nmap F :YcmComplete GoTo<CR>
map T <C-o>
nmap gt :YcmCompleter FixIt<CR>

autocmd! BufWritePost <buffer> YcmCompleter OrganizeImports

let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector

let $JAVA_TOOL_OPTIONS=expand("-javaagent:$HOME/lombok/lombok.jar -Xbootclasspath/a:$HOME/lombok/lombok.jar")
