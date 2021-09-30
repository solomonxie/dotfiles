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
  \             [ 'readonly', 'gitbranch', 'modified', 'relativepath', 'spell' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'filetype', 'mycustom1' ] ]
  \ },
  \ 'component': {
  \   'mycustom1': 'Solomon X.'
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'readonly': 'FuncLightlineReadonly',
  \ },
  \ }

let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '|', 'right': '|' }

function! FuncLightlineReadonly()
    return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! LightlineFilename()
    "REF: https://github.com/itchyny/lightline.vim/issues/293
    "\ 'component_function': {
    "\    'filename': 'LightlineFilename',
    "\  }
    let root = fnamemodify(get(b:, 'git_dir'), ':h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
        return path[len(root)+1:]
    endif
    return expand
endfunction
