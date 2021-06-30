""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                    DEOPLETE - AUTOCOMPLETION (PYTHON3)                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/Shougo/deoplete.nvim
" https://github.com/Shougo/deoplete.nvim/wiki/Completion-Sources

" Dependencies
"   - python3 -m pip install --user pynvim neovim
if has('python3')
    Plug 'Shougo/deoplete.nvim'

    " Plug 'Shougo/deoplete-clangx'   " C/C++ completion source
    " if ! has('vim') ">> For vim only
    Plug 'roxma/nvim-yarp' " Nvim Remote Plugin Framework
    Plug 'roxma/vim-hug-neovim-rpc'  ">> to work with Vim8
    " endif

    " Language Sources
    Plug 'zchee/deoplete-jedi'
    Plug 'ternjs/tern_for_vim', {'do': 'npm -g install neovim tern'}
    Plug 'carlitux/deoplete-ternjs', {'do': 'npm -g install neovim tern'}

    " Must be right after the loading
    let g:deoplete#enable_at_startup = 1
    " Close preview window after completion
        autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
    "Delay time
    let deoplete#custom#option = 100
    " let g:deoplete#auto_complete_delay = 100  "Deprecated
    " Max number of candidates
    let g:deoplete#max_abbr_width = 30
    let g:deoplete#max_menu_width = 40

    " Set multiple options
        "call deoplete#custom#option({
        "\ 'candidate_marks': 10,
        "\ 'auto_complete_delay': 0,
        "\ 'smart_case': v:true,
        "\ })

    " Python (Jedi)
        "let g:deoplete#sources#jedi#enable_typeinfo = 0
        "let g:deoplete#sources#jedi#show_docstring = 0

    " C/C++ (Clangx)
        " Change clang binary path
        "call deoplete#custom#var('clangx', 'clang_binary', '/usr/local/bin/clang')
        " Change clang options
        "call deoplete#custom#var('clangx', 'default_c_options', '')
        "call deoplete#custom#var('clangx', 'default_cpp_options', '')

    " Javascript (Tern)
    let g:deoplete#sources#ternjs#tern_bin = '/usr/local/bin/tern'
    let g:deoplete#sources#ternjs#timeout = 1
    let g:deoplete#sources#ternjs#types = 1
    let g:deoplete#sources#ternjs#depths = 1
    let g:deoplete#sources#ternjs#docs = 1
    let g:deoplete#sources#ternjs#filter = 0
    let g:deoplete#sources#ternjs#case_insensitive = 1
    let g:deoplete#sources#ternjs#guess = 1
    let g:deoplete#sources#ternjs#sort = 0
    let g:deoplete#sources#ternjs#expand_word_forward = 0
    let g:deoplete#sources#ternjs#omit_object_prototype = 1
    let g:deoplete#sources#ternjs#include_keywords = 1
    let g:deoplete#sources#ternjs#in_literal = 0
    let g:deoplete#sources#ternjs#filetypes = [
        \ 'jsx',
        \ 'javascript.jsx',
        \ 'vue',
        \ '...'
    \ ]
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 JAVASCRIPT                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {TernJS}
" HAVE TO CREATE `~/.tern-config` or `.tern-project` in project root to MAKE IT WORK on NodeJS
" {
"     "libs": [
"         "browser",
"         "ecmascript",
"         "jquery",
"         "react",
"         "underscore"
"     ],
"     "plugins": {
"         "node": {},
"         "esmodules": {}
"     }
" }
