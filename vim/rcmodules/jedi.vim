"https://github.com/davidhalter/jedi-vim
Plug 'davidhalter/jedi-vim'
" ^ Will auto install jedi dependencies

" KEY MAPPINGS
nnoremap <Leader>d :call jedi#goto()<CR>
nnoremap <Leader>n :call jedi#usages()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                LAZY LOADING                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable [completion] but keep other functionalities
let g:jedi#completions_enabled = 0

" Disable loading automatically
let g:jedi#auto_initialization = 0

" Disable config auto initialized
let g:jedi#auto_vim_configuration = 0

" Display function call signatures/parameters in insert mode in real-time
let g:jedi#show_call_signatures = 2

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
