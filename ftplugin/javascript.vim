call plug#begin()
Plug 'Lokaltog/vim-easymotion'
Plug 'pangloss/vim-javascript'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

set expandtab
set tabstop=4
set shiftwidth=4

setlocal completefunc=youcompleteme#Complete
setlocal completeopt=preview,menuone

" remove keybindings of ctag
map F :YcmCompleter GoToDefinition<CR>
map T <C-o>
