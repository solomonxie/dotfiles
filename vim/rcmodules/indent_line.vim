" https://github.com/Yggdroot/indentLine
Plug  'Yggdroot/indentLine'    "Beautiful indent lines

let g:indentLine_enabled = 1
let g:indentLine_char='│'
let g:indentLine_conceallevel = 2
let g:indentLine_color_term = 239
let g:indentLine_concealcursor = ''
"let g:indentLine_setColors = 0
"let g:indentLine_setConceal = 0  "0->Show quotes; 1or2->Hide quotes

" BUGS FOR JSON FORMAT --> It hdie/conceal quotes for JSON !!!
" autocmd FileType json set conceallevel = 0  "Manually
" autocmd FileType json let g:indentLine_enabled=0
let g:vim_json_syntax_conceal=0
let g:indentLine_setConceal=0
" If none is working, make sure there's no other JSON plugins,
" then edit the `json.vim` --->
" :e $VIMRUNTIME/syntax/json.vim
" :g/if has('conceal')/s//& \&\& 0/
" :wq
