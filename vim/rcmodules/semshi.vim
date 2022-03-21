""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                    Semshi - Python Syntax Highlighting                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"The Best for python-syntax (pynvim required)

" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" REF: https://github.com/numirias/semshi/issues/105  "FORK: ====> FIXED THE CONFLICT WITH VIM-COMPE
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': ['python']}
" Plug 'sh8/semshi', {'do': ':UpdateRemotePlugins', 'for': ['python']}

hi semshiLocal           ctermfg=209 guifg=#ff875f
hi semshiGlobal          ctermfg=214 guifg=#ffaf00
hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
hi semshiParameter       ctermfg=75  guifg=#5fafff
hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
hi semshiFree            ctermfg=218 guifg=#ffafd7
hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
hi semshiAttribute       ctermfg=49  guifg=#00ffaf
hi semshiSelf            ctermfg=249 guifg=#b2b2b2
hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
sign define semshiError text=E> texthl=semshiErrorSign

let g:semshi#active = v:true
let g:semshi#filetypes = ['python']
let g:semshi#excluded_hl_groups = ['local']
let g:semshi#simplify_markup = v:true
let g:semshi#always_update_all_highlights = v:true
"Don't show a sign by the line-no if a syntax error occurred
let g:semshi#error_sign = v:false
"Tolerate some minor syntax errors to update highlights
let g:semshi#tolerate_syntax_errors = v:true
"Set syntax Highlighting for python
function! MyCustomHighlights()
    hi semshiGlobal      ctermfg=red guifg=#ff0000
endfunction
autocmd FileType python call MyCustomHighlights()
"Add Highlight Groups to persist across colorscheme switches
autocmd ColorScheme * call MyCustomHighlights()
