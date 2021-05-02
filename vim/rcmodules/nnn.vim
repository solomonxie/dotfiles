Plug 'mcchrish/nnn.vim'

if &runtimepath =~ 'nnn'
    "layout
    let g:nnn#layout = { 'left': '~20%' }
    "disable
    let g:nnn#command = 'DISABLE_FILE_OPEN_ON_NAV=1 nnn -l'
endif
