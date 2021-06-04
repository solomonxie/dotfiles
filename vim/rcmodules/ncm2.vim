"https://github.com/ncm2/ncm2/wiki
if has("nvim-0.2.2") && has("python3")
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    " let g:python3_host_prog = system('which python3')  "This was already registered at top level

    " IMPORTANT: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " Suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
    set shortmess+=c

    " our wiki page for a list of sources:
    " Language servers | APIs
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-jedi'  "Python
    Plug 'ncm2/ncm2-vim'  "Vimscript
    Plug 'ncm2/ncm2-tern'  "Javascript
    Plug 'ncm2/ncm2-ultisnips'  "Snippets
    Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
else
    echo 'NCM2 needs requires: pip3 install pynvim'
endif

" Enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
    \ 'name' : 'css',
    \ 'priority': 9,
    \ 'subscope_enable': 1,
    \ 'scope': ['css','scss'],
    \ 'mark': 'css',
    \ 'word_pattern': '[\w\-]+',
    \ 'complete_pattern': ':\s*',
    \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
    \ })
