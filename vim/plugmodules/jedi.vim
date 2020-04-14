"https://github.com/davidhalter/jedi-vim
Plug 'davidhalter/jedi-vim'

if &runtimepath =~ 'jedi'
    " let g:jedi#force_py_version=3.7

    " Disable completion
    let g:jedi#completions_enabled = 0

    let g:jedi#auto_initialization = 0
    let g:jedi#auto_vim_configuration = 0

    let g:jedi#goto_command = "<leader>d"
    " let g:jedi#goto_assignments_command = "<leader>g"
    " let g:jedi#goto_stubs_command = "<leader>s"
    " let g:jedi#goto_definitions_command = ""
    " let g:jedi#documentation_command = "K"
    " let g:jedi#usages_command = "<leader>n"
    " nnoremap <leader>u :call jedi#usages()<CR>
    " let g:jedi#completions_command = "<C-Space>"
    " let g:jedi#rename_command = "<leader>r"
endif
