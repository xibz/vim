call plug#begin()
Plug 'Lokaltog/vim-easymotion'
Plug 'pangloss/vim-javascript'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

set expandtab
set tabstop=2
set shiftwidth=2

setlocal completefunc=youcompleteme#Complete
setlocal completeopt=preview,menuone

" remove keybindings of ctag
unmap F
unmap T
map F :YcmCompleter GoToDefinition<CR>
map T <C-o>

setlocal suffixesadd+=.ts,.tsx
