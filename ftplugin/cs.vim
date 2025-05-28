call plug#begin()
Plug 'Lokaltog/vim-easymotion'
Plug 'OmniSharp/omnisharp-vim'
call plug#end()

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"

let g:OmniSharp_translate_cygwin_wsl = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_timeout = 5
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
augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END
