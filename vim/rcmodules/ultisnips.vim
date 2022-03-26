" REF: https://github.com/SirVer/ultisnips/blob/master/doc/UltiSnips.txt
Plug 'SirVer/ultisnips'  " Track the engine.
Plug 'honza/vim-snippets'  " Snippets are separated from the engine.

" Could be buggy if not specifying the Python version
let g:UltiSnipsUsePythonVersion=3

" Trigger configuration.
" Do not use <tab> if you use YouCompleteMe.
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Specify snippets locations ==> MUST BE FULL PATH (`~` DOESN'T WORK) !!
" let g:UltiSnipsSnippetsDir = expand("~/.vim/mysnippets")
let g:UltiSnipsSnippetDirectories=[expand('~/vim_plugged/vim-snippets/UltiSnips/'), expand('~/myconf/dotfiles/vim/mysnippets')]

" [  Lazy Load Plugins  ]-----------{
    " augroup load_ultisnips
    "     autocmd!
    "     autocmd InsertEnter * call plug#load('ultisnips') | autocmd! load_ultisnips
    " augroup END
" }
