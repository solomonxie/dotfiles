" https://github.com/mbbill/undotree
Plug 'mbbill/undotree'
nnoremap <LocalLeader>d :UndotreeToggle<CR>:UndotreeFocus<CR>

" REF: https://github.com/machakann/vim-highlightedyank
Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 1000

Plug 'bronson/vim-visual-star-search'

"REF: https://github.com/kassio/neoterm
" Plug 'kassio/neoterm'  "For Terminal

" Plug 'tomtom/tcomment_vim'  "2ms

" REF: https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'  "Blazing fast!!

Plug 'bronson/vim-trailing-whitespace'

"REF: https://github.com/wsdjeg/vim-fetch
Plug 'wsdjeg/vim-fetch'  "Open/Edit file from reference: /path/to/file:190:3

" REF: https://github.com/rbgrouleff/bclose.vim
if has('nvim')
    Plug 'rbgrouleff/bclose.vim'  "CLOSE BUF WITHOUT CLOSING WINDOW
endif


" REF: https://github.com/machakann/vim-swap
" Plug 'machakann/vim-swap'  "SWAP FUNCTION ARGUMENTS

" REF: https://github.com/svermeulen/vim-yoink
" Plug 'svermeulen/vim-yoink'  "Keep yank history
" let g:yoinkMaxItems = 100

" Plug 'mhinz/vim-startify'  " Welcome screen -> SLOW

" Plug 'yegappan/mru'

" Plug 'dhruvasagar/vim-zoom'  "Zoom window
