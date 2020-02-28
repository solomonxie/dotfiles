if executable('git')
    Plug 'airblade/vim-gitgutter'  "Shwo diff inline
endif

if &runtimepath =~ 'gitgutter' && executable('git')
    let g:gitgutter_enabled = 1
    let g:gitgutter_map_keys = 0  "Cancel pre-set mapping
    " let g:gitgutter_highlight_lines = 1  "Will hide removed line (annoying)
    let g:gitgutter_highlight_linenrs = 1  "highlight line number only
    let g:gitgutter_preview_win_floating = 1  "for vim compatible
    let g:gitgutter_terminal_reports_focus = 0
    let g:gitgutter_diff_base = 'HEAD'
    " let g:gitgutter_diff_relative_to = 'working_tree'
    if executable('ag')
        let g:gitgutter_grep = 'ag'
    elseif executable('rg')
        let g:gitgutter_grep = 'rg'
    else
        let g:gitgutter_grep = 'grep'
    endif
    let g:gitgutter_async = 1
    set updatetime=100
    if has('nvim')
        highlight GitGutterAdd    guifg=#009900 guibg=<X> ctermfg=2
        highlight GitGutterChange guifg=#bbbb00 guibg=<X> ctermfg=3
        highlight GitGutterDelete guifg=#ff2222 guibg=<X> ctermfg=1
    endif
endif