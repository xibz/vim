call plug#begin()
Plug 'Lokaltog/vim-easymotion'
Plug 'habamax/vim-godot'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

execute pathogen#infect()
setlocal completefunc=youcompleteme#Complete
setlocal completeopt=preview,menuone

" Use actual tabs
set noexpandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
if !has_key( g:, 'ycm_language_server' )
  let g:ycm_language_server = []
endif

let g:ycm_language_server += [
  \   {
  \     'name': 'godot',
  \     'filetypes': [ 'gdscript' ],
  \     'project_root_files': [ 'project.godot' ],
  \     'port': 6005
  \   }
  \ ]
