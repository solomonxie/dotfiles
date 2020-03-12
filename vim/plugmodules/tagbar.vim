"https://github.com/majutsushi/tagbar
if executable('ctags')
    Plug 'majutsushi/tagbar'

    let g:tagbar_left = 0  "Show tagbar on right
    let g:tagbar_autofocus = 1   "Focus on tagbar window when open
    let g:tagbar_autoclose = 1   "Close tagbar window when select tag
    "let g:tagbar_autoshowtag = 0
    let g:tagbar_sort = 0
    let g:tagbar_expand = 0
    let g:tagbar_vertical = 30
    "let g:tagbar_singleclick = 1
    let g:tagbar_compact = 1
    "let g:tagbar_autopreview = 1
    "let g:tagbar_previewwin_pos = 'rightbelow'
    "let g:tagbar_indent = 1
    "let g:tagbar_show_visibility = 1
endif
