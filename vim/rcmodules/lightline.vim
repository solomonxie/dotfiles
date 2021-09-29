"REF: https://github.com/itchyny/lightline.vim
"REF: https://github.com/itchyny/lightline.vim/blob/master/colorscheme.md
Plug 'itchyny/lightline.vim'

set noshowmode  "hide --INSERT--
set laststatus=2 " startup the lightline.vim

" let g:lightline = {'colorscheme': 'one'}  "wombat|one|solarized|papercolor|deus
let g:lightline = {
  \ 'colorscheme': 'deus',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'gitbranch', 'filename', 'modified', 'mycustom1' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype', 'mycustom2' ] ]
  \ },
  \ 'component': {
  \   'mycustom1': 'Solomon X.',
  \   'mycustom2': '-'
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'readonly': 'FuncLightlineReadonly',
  \ },
  \ }

function! FuncLightlineReadonly()
    return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction
