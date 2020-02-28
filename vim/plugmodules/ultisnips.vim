if has('python3')
    Plug 'SirVer/ultisnips'  " Track the engine.
    Plug 'honza/vim-snippets'  " Snippets are separated from the engine.
endif

if &runtimepath =~ 'ultisnips'
    " Trigger configuration.
    " Do not use <tab> if you use YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsJumpForwardTrigger="<C-n>"
    let g:UltiSnipsJumpBackwardTrigger="<C-p>"
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
    " Specify snippets locations
    " !! MUST BE FULL PATH (~ DOESN'T WORK) !!
    let g:UltiSnipsSnippetsDir = $HOME."~/.vim/mysnippets"
    let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/mysnippets']
    " Could be buggy if not specifying the Python version
    if has('python3')
        let g:UltiSnipsUsePythonVersion=3
    endif
endif

" [  Lazy Load Plugins  ]-----------{
    augroup load_ultisnips
        autocmd!
        autocmd InsertEnter * call plug#load('ultisnips') | autocmd! load_ultisnips
    augroup END
" }
