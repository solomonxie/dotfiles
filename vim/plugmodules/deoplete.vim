" https://github.com/Shougo/deoplete.nvim

if has('python3')
    Plug 'Shougo/deoplete.nvim'
    Plug 'zchee/deoplete-jedi'    " Python completion source
    Plug 'Shougo/deoplete-clangx'   " C/C++ completion source
    if has('vim') ">> For vim only
        Plug 'roxma/nvim-yarp' " Nvim Remote Plugin Framework
        Plug 'roxma/vim-hug-neovim-rpc'  ">> to work with Vim8
    endif
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#num_processes = 1
endif

if &runtimepath =~ 'deoplete'
    " Environment
    "set pyxversion=3  "[error]
    "let g:python3_host_prog = "/usr/local/bin/python3"
    " Close preview window after completion
        autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
    "Delay time
    let g:deoplete#auto_complete_delay = 100
    " Max number of candidates
        let g:deoplete#max_abbr_width = 30
        let g:deoplete#max_menu_width = 40
    " Set multiple options
        "call deoplete#custom#option({
        "\ 'candidate_marks': 10,
        "\ 'auto_complete_delay': 0,
        "\ 'smart_case': v:true,
        "\ })
    " Deoplete-jedi
        "let g:deoplete#sources#jedi#enable_typeinfo = 0
        "let g:deoplete#sources#jedi#show_docstring = 0
    " deoplete-clangx
        " Change clang binary path
        "call deoplete#custom#var('clangx', 'clang_binary', '/usr/local/bin/clang')
        " Change clang options
        "call deoplete#custom#var('clangx', 'default_c_options', '')
        "call deoplete#custom#var('clangx', 'default_cpp_options', '')
endif