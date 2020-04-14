"https://github.com/davidhalter/jedi-vim
Plug 'davidhalter/jedi-vim'
" ^ Will auto install jedi dependencies


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             PYTHON INTERPRETER                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:jedi#force_py_version=3.7
"
" Specify Python Interpreter location
" let g:python3_host_prog = glob('/usr/local/bin/python2')
let g:python3_host_prog = glob('~/virtualenv/venv3/bin/python3.7')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                LAZY LOADING                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DISABLE [completion] but keep other functionalities
let g:jedi#completions_enabled = 0
" Disable loading automatically
let g:jedi#auto_initialization = 0
" Disable config auto initialized
let g:jedi#auto_vim_configuration = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                KEY BINDINGS                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <Leader>d :call jedi#goto()<CR>
"
" let g:jedi#goto_command = "<leader>d"
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_stubs_command = "<leader>s"
" let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" nnoremap <leader>u :call jedi#usages()<CR>
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<leader>r"
