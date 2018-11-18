call vundle#begin()
Plugin 'fatih/vim-go'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
call vundle#end()

" Use actual tabs
set noexpandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2

" Go specific plugins
au FileType go map Q <Plug>(go-def-tab)

let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:syntastic_aggregate_errors = 1
let g:go_metalinter_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1
