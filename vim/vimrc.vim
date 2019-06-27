"----------------------------------------------------
"            __     ___           ____   ____       -
"            \ \   / (_)_ __ ___ |  _ \ / ___|      -
"             \ \ / /| | '_ ` _ \| |_) | |          -
"              \ V / | | | | | | |  _ <| |___       -
"               \_/  |_|_| |_| |_|_| \_\\____|      -
"                                                   -
"----------------GENERATED-BY-FIGLET-----------------
"
"--------------[ STANDARD VIMRC ]----------------
" MAINTAINER: Solomon Xie <solomonxiewise@gmail>
" Enviroment: MacOS Sierra / Raspbian / Ubuntu
" -----------------------------------------------

" [  Import Modules  ]-----------{
    source ~/dotfiles/vim/vimrc-plugins.vim
    source ~/dotfiles/vim/vimrc-keymappings.vim
    source ~/dotfiles/vim/vimrc-ui.vim
" }


" [  General Builtin Settings  ]-----------{
    set nocompatible
    set encoding=utf8
    "set spell spelllang=en,en_us,cjk  "Spell check [Ugly]
    "set nospell
    set ignorecase "Case Insensitive
    set smartcase  "Case sensitive when there's upper case in search
    set hidden "Enable to switch buffer without saving
    set number "show line number
    set mouse=a  "a -> all, enbles mouse in Tmux (but text selection will trigger visual mode)
    " Disable mouse selection into visual mode
    "set mouse=nicr
    "noremap <LeftDrag> <LeftMouse>
    "noremap! <LeftDrag> <LeftMouse>
    set nopaste
    set showcmd " show keypress at right-bottom
    set backspace=2 "backspace over everything in insert mode
    set tabstop=4 "Set a tab=4spaces
    set autoindent "auto indent when hit RETURN. could be: smartindent, cindent
    set shiftwidth=4 "Set auto-indent to 4 spaces
    set expandtab "Expand tab to spaces
    "set noexpandtab
    retab "Replace all tabs to spaces on file opened
    "[Key maps timeout]
    set timeout
    set ttimeout
    set timeoutlen=2000
    set ttimeoutlen=0
    "Word recognizing
    "set iskeyword-=_
    "[Auto reload current file]
    set autoread
    au FocusGained,BufEnter * :checktime
" }


" [  Advanced Builtin Settings  ]-----------{
    "set wildmenu
    "set wildmode=longest:full,full
    "<Folding>
    set foldenable
    set foldmethod=syntax
    set foldnestmax=1
    set foldcolumn=0
    setlocal foldlevel=1
    set foldlevelstart=99 "No folding on file open
    "set foldclose=all "Auto-close folding

    "Search Highlighting
    set incsearch "Enable instant search Highlighting
    set hlsearch " Enable Highlighting all matches

    "<Buffer>
        "Change pwd/current-dir
        "set autochdir " Automatically change current directory
        "autocmd BufEnter * cd %:p:h  "Auto change 'pwd' to current folder when enter a buffer
        set splitright  "Default split at right
        "set splitbelow  "Default split at right

    "<Tag>
        set tags=./tags;,tags;./.git/tags;,../.git/tags

    "{Omnicomplete}
    autocmd FileType python set omnifunc=python3complete#Complete
" }


" [  Builtin Autocomplete (omnifunc) ] ----{
        "au FileType python setl ofu=pythoncomplete#CompletePHP
        "au FileType php setl ofu=phpcomplete#CompletePHP
        "au FileType ruby,eruby setl ofu=rubycomplete#Complete
        "au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
        "au FileType c setl ofu=ccomplete#CompleteCpp
        "au FileType css setl ofu=csscomplete#CompleteCSS
" }


" [  Variables  ]-----------{
    "let has_mac = has('mac')
    "let has_vim = has('vim')
    "let has_nvim = has('nvim')
    "let has_lua = has('lua')
    "let has_ruby = has('ruby')
    "let has_py2 = has('python2')  "=> Careful, super slow
    "let has_py3 = has('python3')  "=> Careful, super slow
    "let arch = system("uname -m")
    "if arch == 'armv7l'
    "    let has_rpi = 1
    "elseif arch == 'x86_64'
    "    let has_pc = 1  "Mac / PC
    "endif
    "let file_ext = expand('%:e')
" }


" [  Abbreviations  ]--------{
    " Test
        iabbrev waht what
        iabbrev tehn then
" }

" [  Backup Files  ]--------{
    set backupdir=~/.vim/backup//
    " Force backups to be copied from original, not renamed
    set backupcopy=yes
    " Create folder if not exists
    if !isdirectory(&backupdir)
       silent! call mkdir(&backupdir, 'p')
    endif
" }


" [  Swap files  ]--------{
    set noswapfile    "Autoread & checktime can solve conflict
    "set swapfile    "enable swap file
    set directory=~/.vim/swap//    "set swp file directory.
    " Create folder if not exists
    if !isdirectory(&directory)
       silent! call mkdir(&directory, 'p')
    endif
    set updatecount=20     "save swp file every amount of characters
    " ▼ update also check cursor-holds and other functions, bit expensive one.
    set updatetime=4000   "save swap file every amount of ms
" }


" [  Persistent undo  ]--------{
    if has("persistent_undo")
        set undofile "Save UNDO history to local files
        set undodir=~/.vim/undo//
        " Create folder if not exists
        if !isdirectory(&undodir)
           silent! call mkdir(&undodir, 'p')
        endif
    endif
" }
