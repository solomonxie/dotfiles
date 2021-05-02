Plug 'junegunn/rainbow_parentheses.vim'

if &runtimepath =~ 'rainbow_parentheses'
    let g:rainbow#max_level = 16
    let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
    " Activation based on file type
    augroup rainbow_lisp
      autocmd!
      autocmd FileType lisp,clojure,scheme,python,json,vim RainbowParentheses
    augroup END
endif
