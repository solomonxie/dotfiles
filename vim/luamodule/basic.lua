--REF: https://github.com/mbbill/undotree
use 'mbbill/undotree'
nnoremap <LocalLeader>d :UndotreeToggle<CR>:UndotreeFocus<CR>

-- REF: https://github.com/machakann/vim-highlightedyank
use 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 1000

use 'bronson/vim-visual-star-search'

-- REF: https://github.com/tpope/vim-commentary
use 'tpope/vim-commentary'  --Blazing fast!!

use 'bronson/vim-trailing-whitespace'

--REF: https://github.com/wsdjeg/vim-fetch
use 'wsdjeg/vim-fetch'  --Open/Edit file from reference: /path/to/file:190:3

-- REF: https://github.com/rbgrouleff/bclose.vim
use 'rbgrouleff/bclose.vim'  --CLOSE BUF WITHOUT CLOSING WINDOW

--REF: https://github.com/nathom/filetype.nvim
use 'nathom/filetype.nvim'  --Speed-up over filetype.vim for 10ms
let g:did_load_filetypes = 1
