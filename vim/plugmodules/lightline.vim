" https://github.com/itchyny/lightline.vim

Plug 'itchyny/lightline.vim'

if &runtimepath =~ 'lightline'
    set laststatus=2 " startup the lightline.vim
    let g:lightline = {'colorscheme': 'powerline',}
    " let g:lightline = {
    "   \ 'colorscheme': 'powerline',
    "   \ 'active': {
    "   \   'left': [ [ 'mode', 'paste' ],
    "   \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
    "   \ },
    "   \ 'component': {
    "   \   'helloworld': 'Hello, world!'
    "   \ },
    "   \ }
    " let g:lightline = {
    "   \ 'colorscheme': 'powerline',
    "   \ 'active': {
    "   \   'left': [ [ 'mode', 'paste' ],
    "   \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    "   \ },
    "   \ 'component_function': {
    "   \   'gitbranch': 'FugitiveHead'
    "   \ },
    "   \ }
endif
