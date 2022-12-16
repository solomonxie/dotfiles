" REF: https://github.com/dense-analysis/ale
" IMPORTANT: WON'T WORK PROPERLY IF LINTERS AREN'T LSP BASED OR NOT INSTALLED GLOBALLY
Plug 'dense-analysis/ale'

nnoremap <Leader>d :ALEGoToDefinition<CR>
nnoremap <Leader>r :ALERename<CR>
nnoremap <Leader>u :ALEFindReferences<CR>
nnoremap <C-p> :ALEPreviousWrap<CR>
nnoremap <C-n> :ALENextWrap<CR>
nnoremap <Leader>a :ALEPopulateLocList<CR>
nnoremap <Leader>x :ALEFix<CR>
nnoremap K :ALEHover<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                DEPENDENCIES                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python:
" $ pip install python-language-server
" Javascript:
" $ npm install -g typescript


let g:ale_completion_enabled = 0  "Disable completion
let g:airline#extensions#ale#enabled = 1  "Enable error message in AirLine
let g:ale_virtualtext_cursor = 1

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
"                            CUSTOMIZE HIGHLIGHTS                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"REF: https://jonasjacek.github.io/colors/
hi! ALEVirtualTextError ctermfg=200
hi! ALEVirtualTextWarning ctermfg=250
hi! ALEVirtualTextInfo ctermfg=226
hi! ALEVirtualTextStyleError ctermfg=200
hi! ALEVirtualTextInfo ctermfg=226


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       LANGUAGE SERVER PROTOCOL (LSP)                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " ===Pylsp===
" https://github.com/palantir/python-language-server/issues/190
" let g:ale_python_pylsp_config = {
" \    'pylsp': {
" \        'configurationSources': '["flake8"]'
" \    },
" \}
" "^^^^^^^^^^^^^^DON'T SPECIFY flake8 FROM LSP, THAT'S VERY BUGGY!!!^^^^^^^^^^



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  LINTERS                                   "
"               LSP will be specified in the "g:ale_linters" below           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Available Linters:
" https://github.com/dense-analysis/ale/tree/master/ale_linters

"{Python}
"REF: https://github.com/palantir/python-language-server  "Pylsp"

"{Vim}
" REF: https://github.com/iamcco/vim-language-server  "vimls"

"{Javascript}
" REF: https://github.com/typescript-language-server/typescript-language-server  "tsserver"

"{Bash}
" REF: https://github.com/bash-lsp/bash-language-server  "bash-language-server"

" let g:ale_linters_explicit = 1  "Only run linters when I specify = Disable linters I didn't specify

" =======================Custom args to linters / fixers==========================

" Make it 'g:' to only run linters I specified
let g:ale_linters = {
\   'sh': ['language_server'],
\   'python': ['pyright', 'flake8'],
\   'vim': ['vimls'],
\   'dockerfile': ['dockerfile_lint'],
\   'javascript': ['tsserver', 'eslint'],
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\ }

" ===ALE LINT GENRAL===
let g:ale_lint_delay = 200
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 0
let g:ale_cache_executable_check_failures = 1


" ==Flake8==
" HELP: :help ale-python-flake8
" HELP: pip install flake8==3.9.2  # 4.0 no longer respect user config file
let g:ale_python_flake8_executable = 'flake8'
let g:ale_python_flake8_use_global = 1
let g:ale_python_flake8_options = '--config $HOME/.config/flake8'
let g:ale_python_flake8_change_directory = "project"  "project|file|off

" ==Mypy==
let g:ale_python_mypy_options = '--ignore-missing-imports'
" let g:ale_python_mypy_options = '--follow-imports skip'

" ==Pylint==
let g:ale_python_pylint_options = '--rcfile=~/.config/pylintrc'

" ===pyright===
" REF: https://github.com/microsoft/pyright/blob/main/docs/settings.md
let g:ale_python_pyright_config = {
\ 'pyright': {
\   'typeCheckingMode': 'off',
\ },
\ 'python': {
\   'pythonPath': '.git/venv/bin/python',
\   'venvPath': '.git/venv',
\   'analysis ': {
\     'autoImportCompletions': v:true,
\     'autoSearchPaths': v:true,
\     'diagnosticMode': 'workspace',
\     'useLibraryCodeForTypes': v:true,
\   }
\ },
\}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   FIXERS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let b:ale_fixers = {
\   'python': ['autopep8'],
\   'c++': ['clang', 'gcc'],
\   'javascript': ['prettier']
\}



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                DEPENDENCIES                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function CheckHealthALE()
    if &filetype == 'python' && !executable('mypy')
        echo "MyPy not installed for ALE linters: $ python3 -m pip install -U mypy"
    endif
    if &filetype == 'python' && !executable('pylsp')
        echo "ALE linters missing: $ python3 -m pip install python-language-server"
    endif

    if &filetype == 'js' && !executable('tsserver')
        echo "ALE linters missing: $ python3 -m pip install tyepscript"
    endif

    if &filetype == 'vim' && !executable('vim-language-server')
        echo "ALE linters missing: $ npm install -g vim-language-server"
    endif

    if &filetype == 'cmake' && !executable('cmakelint')
        echo "ALE linters missing: $ pip install cmakelint"
    endif
endfunction
" autocmd BufReadPre * call CheckHealthALE()
