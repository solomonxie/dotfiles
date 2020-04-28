if executable('ctags')
    Plug 'liuchengxu/vista.vim'  "More friendly tagbar

    let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
    let g:vista_default_executive = 'ctags'
    let g:vista_sidebar_width = 60
    " let g:vista_sidebar_position = 'vertical botright'  "botright | topleft
    " let g:vista_sidebar_position = 1  # Any value will make it to the top possition
    " let g:vista_fzf_preview = ['right:30%']
    " let g:vista_default_executive = 1 "Close vista after jump to a link
    let g:vista#renderer#enable_icon = 1
    let g:vista#renderer#icons = {
    \   "function": "\uf794",
    \   "variable": "\uf71b",
    \  }
endif
