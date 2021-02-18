call vundle#begin()
Plugin 'fatih/vim-go'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()

" Install syntastic
execute pathogen#infect()
setlocal completefunc=youcompleteme#Complete
setlocal completeopt=preview,menuone

" Use actual tabs
set noexpandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2

" Go specific plugins
" au FileType go map Q <Plug>(go-def-tab)
map t <C-]>
map T <C-t>

" remap ctrl-x to automatically open autocomplete window and option
inoremap <C-x> <C-X><C-O>
" map ctrl-o to toggle between autocomplete options
inoremap <C-o> <C-O>

let g:go_metalinter_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1

" syntastic stuffery
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:syntastic_aggregate_errors = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
