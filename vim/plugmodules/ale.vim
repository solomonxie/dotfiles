""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                LINTER: ALE                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'

" Available Linters:
" https://github.com/dense-analysis/ale/tree/master/ale_linters

let g:ale_fix_on_save = 0
let b:ale_warn_about_trailing_whitespace = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

" Only lint on save
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" let g:ale_lint_on_enter = 0


let g:ale_linters_explicit = 1  "Only run linters when I specify
" Make it 'g:' to only run linters I specified
let g:ale_linters = {
\   'sh': ['shell'],
\   'python': ['flake8'],
\   'make': ['checkmake'],
\   'dockerfile': ['dockerfile_lint'],
\ }
" let b:ale_fixers = {
" \   'python': ['autopep8'],
" \   'c++': ['clang', 'gcc']
" \}
