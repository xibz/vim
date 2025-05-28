call plug#begin()
Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'gyim/vim-boxdraw'
Plug 'kamykn/spelunker.vim'
call plug#end()

let g:mkdp_auto_start = 1
set virtualedit+=all
