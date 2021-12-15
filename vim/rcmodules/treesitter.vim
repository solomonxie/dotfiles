""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     TREE SITTER - FOR BUILDING PLUGINS                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" REF: https://tree-sitter.github.io/tree-sitter/
" REF: https://github.com/nvim-treesitter/nvim-treesitter

" ACTIONS:
" 1. Download Nvim 0.5+ Release
" 2. :PlugInstall
" 3. :TSInstall python javascript bash json

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'
