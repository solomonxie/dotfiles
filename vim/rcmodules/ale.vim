" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'

" KEY MAPPINGS
" Go Error Next
nnoremap <C-n> :ALENext<CR>
" Go Error Previous
nnoremap <C-p> :ALEPrevious<CR>
" nnoremap <LocalLeader>s :SyntasticCheck<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                DEPENDENCIES                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python:
" $ pip install python-language-server --user
" Javascript:
" $ yarn global add eslint


let g:ale_completion_enabled = 0  "Disable completion
let g:airline#extensions#ale#enabled = 1  "Enable error message in AirLine

let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_set_highlights = 1
let b:ale_warn_about_trailing_whitespace = 1

" Only lint on save
let g:ale_lint_on_text_changed = 'always'  "never|always
" let g:ale_lint_on_insert_leave = 0
" let g:ale_lint_on_enter = 0

" Quickfix (:copen to open quickfix list)
let g:ale_set_quickfix = 1
let g:ale_open_list = 0  "Disable auto-open quickfix when error occurs
let g:ale_keep_list_window_open = 0  "Auto-close quickfix when no error
let g:ale_list_window_size = 5
let g:ale_set_loclist = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       LANGUAGE SERVER PROTOCOL (LSP)                       "
"               LSP will be specified in the "g:ale_linters" below           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:ale_linters = {'python': ['pyls']}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  LINTERS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Available Linters:
" https://github.com/dense-analysis/ale/tree/master/ale_linters
let g:ale_linters_explicit = 1  "Only run linters when I specify

" =======================Custom args to linters / fixers==========================
let g:ale_python_mypy_options = '--ignore-missing-imports'
" let g:ale_python_mypy_options = '--follow-imports skip'
let g:ale_python_pylint_options = '--rcfile=~/dotfiles/etc/config/pylint/pylintrc.ini'
" Flake8
let g:ale_python_flake8_use_global = 1  "Python -> Flake8
let g:ale_python_flake8_options = '--max-line-length=120'
" Pyls
" https://github.com/palantir/python-language-server/issues/190
let g:ale_python_pyls_config = {
\    'pyls': {
\        'configurationSources': ['flake8']
\    },
\}


" Make it 'g:' to only run linters I specified
let g:ale_linters = {
\   'sh': ['shell'],
\   'python': ['flake8'],
\   'make': ['checkmake'],
\   'vim': ['vint'],
\   'dockerfile': ['dockerfile_lint'],
\   'javascript': ['eslint'],
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   FIXERS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let b:ale_fixers = {
\   'python': ['autopep8'],
\   'c++': ['clang', 'gcc'],
\   'javascript': ['prettier', 'eslint']
\}



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                DEPENDENCIES                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! executable('mypy')
    echo "MyPy not installed for ALE linters: $ python3 -m pip install -U mypy"
endif
