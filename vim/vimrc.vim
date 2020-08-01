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

" Get Full path of ~, e.g., /home/ubuntu
let $HOME = expand('~')
let $DOTFILES = expand('~') . '/dotfiles'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        VIM-PLUG MANAGER FOR PLUGINS                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/junegunn/vim-plug
if !filereadable(expand('~/.vim/autoload/plug.vim'))
    echo 'Downlading vim-plug manager...'
    let url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    call system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs ' . url)
    echo 'Done.'
endif
call plug#begin('~/.vim/plugged')
    "{Common}
        source ~/dotfiles/vim/plugmodules/nvim_provider.vim  "IMPORTANT!
        source ~/dotfiles/vim/plugmodules/basic.vim
        source ~/dotfiles/vim/plugmodules/misc.vim
    "{UI}
        source ~/dotfiles/vim/plugmodules/indent_line.vim
        source ~/dotfiles/vim/plugmodules/airline.vim
        source ~/dotfiles/vim/plugmodules/nerdtree.vim
        " source ~/dotfiles/vim/plugmodules/chadtree.vim
        source ~/dotfiles/vim/plugmodules/semshi.vim
        source ~/dotfiles/vim/plugmodules/vista.vim
        source ~/dotfiles/vim/plugmodules/tagbar.vim
        " source ~/dotfiles/vim/plugmodules/markbar.vim
        " source ~/dotfiles/vim/plugmodules/syntastic.vim
    "{Completion | Usages | Definitions}
        source ~/dotfiles/vim/plugmodules/fzf.vim
        source ~/dotfiles/vim/plugmodules/ale.vim
        source ~/dotfiles/vim/plugmodules/deoplete.vim
        source ~/dotfiles/vim/plugmodules/ultisnips.vim
        source ~/dotfiles/vim/plugmodules/any_jump.vim
        " source ~/dotfiles/vim/plugmodules/ctags.vim
        " source ~/dotfiles/vim/plugmodules/YCM.vim
        " source ~/dotfiles/vim/plugmodules/coc.vim
        " source ~/dotfiles/vim/plugmodules/ncm2.vim
    "{Git}
        source ~/dotfiles/vim/plugmodules/tig.vim
        source ~/dotfiles/vim/plugmodules/fugitive.vim
        source ~/dotfiles/vim/plugmodules/gitgutter.vim
    "{Python}
        source ~/dotfiles/vim/plugmodules/autopairs.vim
        source ~/dotfiles/vim/plugmodules/jedi.vim
        " source ~/dotfiles/vim/plugmodules/ped.vim
call plug#end()
" source ~/dotfiles/vim/vimrc-plugins.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               IMPORT MODULES                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MUST BE LOADED AFTER PLUGINS
source ~/dotfiles/vim/vimrc-functions.vim
source ~/dotfiles/vim/vimrc-commands.vim
source ~/dotfiles/vim/vimrc-keymappings.vim
source ~/dotfiles/vim/vimrc-ui.vim
if filereadable(expand('~/vimrc-local.vim'))
    source ~/vimrc-local.vim
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         GENERAL BUILT-IN SETTINGS                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
set nopaste  "IMPORTANT: If it's on, vim will auto indent (messed up) on your paste
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

" Automatically set view in the center when jump to the matches
" https://vim.fandom.com/wiki/Make_search_results_appear_in_the_middle_of_the_screen
set scrolloff=5  "Set 99 to make it center

" Neovim feature of :%s/a/b/
" if has('nvim')
"     set inccommand=split
" endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         ADVANCED BUILT-IN SETTINGS                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set wildmenu
"set wildmode=longest:full,full
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


"Set syntax
autocmd FileType *.conf,*.config,*.cfg,*.ini set syntax=cfg



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          PERSISTENT FILE SETTINGS                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [  Backup Files  ]--------{
    set backup
    set writebackup
    " set backupcopy=yes  " Force backups to be copied from original, not renamed
    " Create folder if not exists
    if !isdirectory(&backupdir)
       silent! call mkdir(&backupdir, 'p')
    endif
    set backupdir=~/.vim/backup//
" }


" [  Swap files  ]--------{
    set noswapfile  "Disable Swap files
    "set swapfile  "Enable swap file
    set directory=~/.vim/swap//    "set swp file directory.
    " Create folder if not exists
    if !isdirectory(&directory)
       silent! call mkdir(&directory, 'p')
    endif
    set updatecount=20     "save swp file every amount of characters
    " ▼ update also check cursor-holds and other functions, bit expensive one.
    set updatetime=100   "save swap file every amount of ms
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    FOLD                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nofoldenable  "Cancel all folds when enter vim
set foldmethod=manual  "manual|syntax
autocmd BufEnter * set foldmethod=manual
" set foldlevelstart=99  "No folding on file open
" set foldlevel=1
" set foldclose=all  "Auto-close folding
" set foldnestmax=1
" set foldcolumn=0

" [Persistent Folding]
" augroup AutoSaveFolds
"   autocmd!
"   autocmd BufWinLeave * mkview 1
"   autocmd BufWinEnter * silent! loadview 1
" augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               MISC SETTINGS                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [  Builtin Autocomplete (omnifunc) ] ----{
    autocmd FileType python set omnifunc=python3complete#Complete
    "autocmd FileType python setl ofu=pythoncomplete#CompletePHP
    "autocmd FileType php setl ofu=phpcomplete#CompletePHP
    "autocmd FileType ruby,eruby setl ofu=rubycomplete#Complete
    "autocmd FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
    "autocmd FileType c setl ofu=ccomplete#CompleteCpp
    "autocmd FileType css setl ofu=csscomplete#CompleteCSS
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
        " iabbrev waht what
        " iabbrev tehn then
" }


