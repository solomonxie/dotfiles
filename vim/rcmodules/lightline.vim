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
  \             [ 'readonly', 'gitbranch', 'modified', 'filetype', 'relativepath', 'spell' ],
  \   ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'mycustom1', 'modified' ],
  \   ]
  \ },
  \ 'component': {
  \   'mycustom1': 'Solomon X.',
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'readonly': 'FuncLightlineReadonly',
  \   'lineinfo': 'LightlineLineinfo',
  \ },
\}

" components: 'fileformat', 'fileencoding', 'filetype'

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

"REF: https://yeripratama.com/blog/customizing-vim-lightline/
function! LightlineLineinfo() abort  "abort: stop function as soon as error occurs
    if winwidth(0) < 86
        return ''
    endif

    let l:cur_line = printf('%-2s', line('.'))
    let l:max_line = printf('%-2s', line('$'))
    let l:line_display = 'L:' . l:cur_line . '/' . l:max_line

    let l:cur_col = printf('%-2s', col('.'))
    let l:max_col = printf('%-2s', col('$'))
    let l:col_display = 'C:' . l:cur_col . '/' . l:max_col

    let l:lineinfo = l:col_display . ' ' . l:line_display
    return l:lineinfo
endfunction


function! LightLineSelectionInfo() abort
    let l:line_count = line("'>") - line("'<") + 1
    let l:select_info = 'S:' . l:line_count
    return l:select_info
endfunction
