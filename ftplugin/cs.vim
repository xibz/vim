call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'OmniSharp/omnisharp-vim'
call vundle#end()

set expandtab
set tabstop=4
set shiftwidth=4

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_timeout = 5
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_highlight_groups = {
	\ 'csUserIdentifier': [
	\   'constant name', 'enum member name', 'field name', 'identifier',
	\   'local name', 'parameter name', 'property name', 'static symbol'],
	\ 'csUserInterface': ['interface name'],
	\ 'csUserMethod': ['extension method name', 'method name'],
	\ 'csUserType': ['class name', 'enum name', 'namespace name', 'struct name']
\}
let g:OmniSharp_diagnostic_overrides = {
	\ 'IDE0010': {'type': 'I'},
	\ 'IDE0055': {'type': 'W', 'subtype': 'Style'},
	\ 'CS8019': {'type': 'None'},
	\ 'RemoveUnnecessaryImportsFixable': {'type': 'None'}
\}
let g:OmniSharp_diagnostic_showid = 1
