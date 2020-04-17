""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             LINTER: Syntastic                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/vim-syntastic/syntastic
"Static Code Check
Plug 'vim-syntastic/syntastic'

let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height = 5
highlight SyntasticErrorSign guifg=white guibg=black
"let g:syntastic_check_on_wq = 0

" CHECKERS
" :help syntastic-checkers
" Format: let g:syntastic_<filetype>_checkers = ['<checker-name>']
"
" [Python]
let g:syntastic_python_checkers=['flake8']
" [Clang]
" let g:syntastic_cpp_checkers = ['gcc']
" let g:syntastic_cpp_compiler = 'gcc'
" [SH]
" let g:syntastic_sh_checkers = ['shell']
" [Make]
" let g:syntastic_cmake_checkers = ['cmakelint']
" [Dockerfile]
" let g:syntastic_dockerfile_checkers = ['dockerfile-lint']
