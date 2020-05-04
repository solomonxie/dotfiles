if executable('ctags')
    Plug 'liuchengxu/vista.vim'  "More friendly tagbar

    let g:vista#executives = ['ale', 'coc', 'ctags', 'lcn', 'nvim_lsp', 'vim_lsc', 'vim_lsp']
    let g:vista#extensions = ['markdown', 'rst']
    let g:vista#finders = ['fzf', 'skim']
    let g:vista_blink = [2, 100]
    let g:vista_close_on_jump = 1
    let g:vista_echo_cursor = 1
    let g:vista_cursor_delay = 0  "Important
    let g:vista_default_executive = 'ctags'
    let g:vista_executive_for = {'vim': 'ctags', 'cpp': 'coc', 'python': 'ctags'}
    let g:vista_find_absolute_nearest_method_or_function = 0
    let g:vista_find_nearest_method_or_function_delay = 300
    let g:vista_fold_toggle_icons = ['▼', '▶']
    let g:vista_fzf_preview = ['up:60%']
    let g:vista_icon_indent = ['╰─▸ ', '├─▸ ']
    let g:vista_no_mappings = 0
    let g:vista_sidebar_width = 40
    let g:vista_top_level_blink = [2, 100]
    let g:vista_update_on_text_changed = 0
    let g:vista_update_on_text_changed_delay = 500
endif
