"https://github.com/ncm2/ncm2/wiki
if has("nvim-0.2.2") && has("python3")
    Plug 'Shougo/neco-vim'
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
    " Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}  "Javascript
    Plug 'ncm2/ncm2-ultisnips'  "Snippets

    " REF: https://github.com/autozimu/LanguageClient-neovim/tree/master
    " DEPENDENCIES:
    " > LINXU
    " > Rust + Cargo + $ ./vim/plugged/LanguageClient-neovim/install.sh
    " Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
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
autocmd User Ncm2Plugin call ncm2#register_source({
    \ 'name' : 'css',
    \ 'priority': 9,
    \ 'subscope_enable': 1,
    \ 'scope': ['css','scss'],
    \ 'mark': 'css',
    \ 'word_pattern': '[\w\-]+',
    \ 'complete_pattern': ':\s*',
    \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
    \ })

" let g:LanguageClient_serverCommands = {
"     \ 'python': [trim(system('which pyls')],
"     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"     \ 'ruby': [trim(system('which solargraph'), 'stdio'],
"     \ }

let g:LanguageClient_autoStart = 1
let g:LanguageClient_devel = 1 " Use rust debug build
let g:LanguageClient_loggingLevel = 'DEBUG' " Use highest logging level


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 JAVASCRIPT                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {TernJS}
" REF: https://ternjs.net/doc/manual.html#configuration
" $ touch ~/.tern-config
" OR
" $ touch ./tern-project
" HAVE TO CREATE `~/.tern-config` or `.tern-project` in project root to MAKE IT WORK on NodeJS
" {
"     "libs": [
"         "browser",
"         "ecmascript",
"         "jquery",
"         "react",
"         "underscore"
"     ],
"     "plugins": {
"         "node": {},
"         "esmodules": {}
"     }
" }
