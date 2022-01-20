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
Plug 'rbgrouleff/bclose.vim'  "CLOSE BUF WITHOUT CLOSING WINDOW


"REF: https://github.com/nathom/filetype.nvim
Plug 'nathom/filetype.nvim'  "Speed-up over filetype.vim for 10ms
let g:did_load_filetypes = 1

""REF: https://github.com/airblade/vim-rooter
"Plug 'airblade/vim-rooter'
"" autocmd BufEnter * :Rooter
"let g:rooter_patterns = ['.git', 'Makefile', 'envfile*']
"let g:rooter_change_directory_for_non_project_files = 'current'
"let g:rooter_silent_chdir = 0
"let g:rooter_resolve_links = 1

"REF: https://github.com/ahmedkhalf/project.nvim
Plug 'ahmedkhalf/project.nvim'

""REF: https://github.com/Shatur/neovim-session-manager
"Plug 'Shatur/neovim-session-manager'

"REF: https://github.com/mhinz/vim-signify
" Plug 'mhinz/vim-signify'  "Git Diff

" Plug 'lewis6991/gitsigns.nvim'

" REF: https://github.com/machakann/vim-swap
" Plug 'machakann/vim-swap'  "SWAP FUNCTION ARGUMENTS

" REF: https://github.com/svermeulen/vim-yoink
" Plug 'svermeulen/vim-yoink'  "Keep yank history
" let g:yoinkMaxItems = 100

" Plug 'mhinz/vim-startify'  " Welcome screen -> SLOW

" Plug 'yegappan/mru'

" Plug 'dhruvasagar/vim-zoom'  "Zoom window

" Plug 'justinmk/vim-sneak'
" let g:sneak#label = 1
