"REF: https://github.com/majutsushi/tagbar
if executable('ctags')
    Plug 'majutsushi/tagbar', {'on': ['TagbarToggle', 'TagbarJumpNext', 'TagbarJumpPrev']}
    " >> KEY MAPPINGS
    noremap gt :TagbarToggle<CR>
    noremap g] :TagbarJumpNext<CR>
    noremap g[ :TagbarJumpPrev<CR>

    let g:tagbar_left = 0  "Show tagbar on right
    let g:tagbar_autofocus = 1   "Focus on tagbar window when open
    let g:tagbar_autoclose = 1   "Close tagbar window when select tag
    let g:tagbar_autoshowtag = 1
    let g:tagbar_sort = 0
    let g:tagbar_expand = 0
    let g:tagbar_vertical = 10
    "let g:tagbar_singleclick = 1
    let g:tagbar_compact = 1
    " let g:tagbar_autopreview = 1
    " let g:tagbar_previewwin_pos = 'rightbelow'  "rightbelow |
    let g:tagbar_indent = 1
    let g:tagbar_show_visibility = 1
    let g:tagbar_foldlevel = 0
    let g:tagbar_use_cache = 1
    let g:tagbar_file_size_limit = 102400
    let g:tagbar_wrap = 1
    let g:tagbar_highlight_method = 'nearest'

    "{UI}
    " let g:tagbar_iconchars = ['▶', '▼'] "(default on Linux and Mac OS X)
    " let g:tagbar_iconchars = ['▸', '▾']
    let g:tagbar_iconchars = ['▷', '◢']
    " let g:tagbar_iconchars = ['+', '-'] "(default on Windows)
    let g:tagbar_scopestrs = {
        \    'class': "CLASS",
        \    'const': "\uf8ff",
        \    'constant': "CONSTANTS",
        \    'enum': "\uf702",
        \    'field': "\uf30b",
        \    'func': "FUNC",
        \    'function': "FUNC",
        \    'getter': "\ufab6",
        \    'implementation': "\uf776",
        \    'interface': "\uf7fe",
        \    'map': "\ufb44",
        \    'member': "\uf02b",
        \    'method': "METHOD",
        \    'setter': "\uf7a9",
        \    'variable': "VAR",
        \ }

    let g:airline#extensions#tagbar#enabled = 0
endif
