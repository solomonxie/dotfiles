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
" Enviroment: MacOS Sierra / Raspbian / Ubuntu
" -----------------------------------------------

" Get Full path of ~, e.g., /home/ubuntu
" let $HOME = expand('~')
" let $DOTFILES = expand('~') . '/myconf/dotfiles'

" HAS TO DEFINE LEADER ASAP BECAUSE KMAP BEFORE THAT IS NOT WORKING
let mapleader = ","
" let maplocalleader = ""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        VIM-PLUG MANAGER FOR PLUGINS                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/junegunn/vim-plug
" if !filereadable(expand('~/.vim/autoload/plug.vim'))
"     echo 'Downlading vim-plug manager...'
"     let url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"     call system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs ' . url)
"     echo 'Done.'
" endif

call plug#begin('~/vim_plugged')
    "{Common}
        source ~/myconf/dotfiles/vim/rcmodules/perf_profiling.vim
        source ~/myconf/dotfiles/vim/rcmodules/nvim_provider.vim  "IMPORTANT!
        source ~/myconf/dotfiles/vim/rcmodules/misc.vim
        source ~/myconf/dotfiles/vim/rcmodules/hop.vim
    "{UI}
        " source ~/myconf/dotfiles/vim/rcmodules/indent_line.vim  "BUGGY
        source ~/myconf/dotfiles/vim/rcmodules/blankline.vim  "INDENT-LINE
        " source ~/myconf/dotfiles/vim/rcmodules/airline.vim  "681ms+
        source ~/myconf/dotfiles/vim/rcmodules/buftabline.vim  "Blazing fast!
        source ~/myconf/dotfiles/vim/rcmodules/lightline.vim  "Blazing fast!
        " source ~/myconf/dotfiles/vim/rcmodules/statusline.vim
        source ~/myconf/dotfiles/vim/rcmodules/nerdtree.vim
        " source ~/myconf/dotfiles/vim/rcmodules/neotree.vim  "BUGGY!!! HEAVY
        source ~/myconf/dotfiles/vim/rcmodules/netrw.vim
        " source ~/myconf/dotfiles/vim/rcmodules/vinegar.vim
        " source ~/myconf/dotfiles/vim/rcmodules/chadtree.vim
        source ~/myconf/dotfiles/vim/rcmodules/semshi.vim
        source ~/myconf/dotfiles/vim/rcmodules/ctags.vim  "300ms+, 99% CPU
        source ~/myconf/dotfiles/vim/rcmodules/tagbar.vim  "300ms+
        " source ~/myconf/dotfiles/vim/rcmodules/vista.vim  "TAG BAR
        " source ~/myconf/dotfiles/vim/rcmodules/markbar.vim
        " source ~/myconf/dotfiles/vim/rcmodules/syntastic.vim
        " source ~/myconf/dotfiles/vim/rcmodules/telescope.vim  "SLOW
        " source ~/myconf/dotfiles/vim/rcmodules/which_key.vim
    "{Completion | Usages | Definitions}
        " source ~/myconf/dotfiles/vim/rcmodules/replace.vim
        source ~/myconf/dotfiles/vim/rcmodules/fzf.vim
        source ~/myconf/dotfiles/vim/rcmodules/ale.vim
        " source ~/myconf/dotfiles/vim/rcmodules/deoplete.vim
        source ~/myconf/dotfiles/vim/rcmodules/ultisnips.vim
        source ~/myconf/dotfiles/vim/rcmodules/anyjump.vim
        " source ~/myconf/dotfiles/vim/rcmodules/YCM.vim
        " source ~/myconf/dotfiles/vim/rcmodules/coc.vim
        " source ~/myconf/dotfiles/vim/rcmodules/coq.vim
        " source ~/myconf/dotfiles/vim/rcmodules/ncm2.vim
        source ~/myconf/dotfiles/vim/rcmodules/autopairs.vim  "Brakets/Quotes
        " source ~/myconf/dotfiles/vim/rcmodules/treesitter.vim
    "{NEOVIM + LANGUAGE SERVER + LUA}
        source ~/myconf/dotfiles/vim/rcmodules/nvim_lspconfig.vim
        " source ~/myconf/dotfiles/vim/rcmodules/nvim_lsp_compl.vim
        " source ~/myconf/dotfiles/vim/rcmodules/nvim_compe.vim
        source ~/myconf/dotfiles/vim/rcmodules/nvim_cmp.vim
        " source ~/myconf/dotfiles/vim/rcmodules/lspsaga.vim  "Buggy
    "{Git}
        source ~/myconf/dotfiles/vim/rcmodules/tig.vim
        " source ~/myconf/dotfiles/vim/rcmodules/fugitive.vim
        " source ~/myconf/dotfiles/vim/rcmodules/gitgutter.vim  "50ms+
        source ~/myconf/dotfiles/vim/rcmodules/gitsigns.vim  "BLAZING FAST: 0.2262ms
        " source ~/myconf/dotfiles/vim/rcmodules/blame.vim
    "{Python}
        " source ~/myconf/dotfiles/vim/rcmodules/jedi.vim
        " source ~/myconf/dotfiles/vim/rcmodules/ped.vim
    "{NodeJS}
        " source ~/myconf/dotfiles/vim/rcmodules/vimspector.vim
        " source ~/myconf/dotfiles/vim/rcmodules/nvim_dap.vim
    "{Misc}
        " source ~/myconf/dotfiles/vim/rcmodules/dadbod.vim  "DB client
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                LUA CONFIGS                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MUST BE LOADED AFTER PLUGINS
luafile ~/myconf/dotfiles/vim/rcmodules/lua/nvimrc-functions.lua

luafile ~/myconf/dotfiles/vim/rcmodules/lua/misc.lua
" luafile ~/myconf/dotfiles/vim/rcmodules/lua/lsp-python.lua
luafile ~/myconf/dotfiles/vim/rcmodules/lua/lsp-lua.lua
luafile ~/myconf/dotfiles/vim/rcmodules/lua/gitsigns.lua
luafile ~/myconf/dotfiles/vim/rcmodules/lua/lsp-installer.lua
luafile ~/myconf/dotfiles/vim/rcmodules/lua/nvim_cmp.lua
luafile ~/myconf/dotfiles/vim/rcmodules/lua/lspsaga.lua
luafile ~/myconf/dotfiles/vim/rcmodules/lua/treesitter.lua
luafile ~/myconf/dotfiles/vim/rcmodules/lua/whichkey.lua
luafile ~/myconf/dotfiles/vim/rcmodules/lua/blankline.lua
" luafile ~/myconf/dotfiles/vim/rcmodules/lua/lsp-sql.lua
" luafile ~/myconf/dotfiles/vim/rcmodules/lua/lsp-vim.lua
" luafile ~/myconf/dotfiles/vim/rcmodules/lua/lsp-js.lua
" luafile ~/myconf/dotfiles/vim/rcmodules/lua/schedule.lua

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               IMPORT MODULES                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/myconf/dotfiles/vim/vimrc-functions.vim
source ~/myconf/dotfiles/vim/vimrc-commands.vim
source ~/myconf/dotfiles/vim/vimrc-keymappings.vim
source ~/myconf/dotfiles/vim/vimrc-ui.vim
" source ~/myconf/dotfiles/vim/rcmodules/schedules.vim
if filereadable(expand('~/.config/vimrc-local.vim'))
    source ~/.config/vimrc-local.vim
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         GENERAL BUILT-IN SETTINGS                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set encoding=utf8
"set spell spelllang=en,en_us,cjk  "Spell check [Ugly]
set nospell
set ignorecase "Case Insensitive
set smartcase  "Case sensitive when there's upper case in search
set hidden "Enable to switch buffer without saving
set number "show line number
set mouse=a  "a -> all, enbles mouse in Tmux (but text selection will trigger visual mode)
" Disable mouse selection into visual mode
"set mouse=nicr
"noremap <LeftDrag> <LeftMouse>
"noremap! <LeftDrag> <LeftMouse>

set shell=/bin/sh

" Persistent Session Options
set sessionoptions-=options    " do not store global and local values in a session
set sessionoptions-=folds      " do not store folds
" set sessionoptions=blank,buffers,curdir,tabpages,winsize,terminal

"Avoid annoying continuation of comment (:help fo-table)
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Avoid prompt to hit enter for every echo when it's not enough to show full msg
set shortmess+=T
set cmdheight=1

filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,menuone,noselect
" Bugfix for insert mode in SQL file:
" SQLComplete, The dbext plugin must be loaded for dynamic SQL completion -->
let g:omni_sql_default_compl_type = 'syntax'

autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>

set nopaste  "IMPORTANT: If it's on, vim will auto indent (messed up) on your paste
set showcmd " show keypress at right-bottom
set backspace=2 "backspace over everything in insert mode
set tabstop=4 "Set a tab=4spaces
set smartindent "Auto indent after hit RETURN: autoindent, smartindent, cindent
set shiftwidth=4 "Set auto-indent to 4 spaces
set expandtab "Expand tab to spaces
retab "Replace all tabs to spaces on file opened
filetype plugin indent on

"[Key maps timeout]
set timeout
set ttimeout
set timeoutlen=1000
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

set isfname-==  "When using 'gf', ignore '=' as part of the file name

"IMPORTANT: NeoVim's Shada (viminfo) shares all session marks/jumplist/buffers, which is super annoying
set shada=""
"set viminfo='100,f1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         ADVANCED BUILT-IN SETTINGS                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set wildmenu
"set wildmode=longest:full,full
"Search Highlighting
set incsearch "Enable instant search Highlighting
set hlsearch " Enable Highlighting all matches

"Disable runtime matchit.vim (SLOW)
let g:loaded_matchit = 1

"Disable new line with comment
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

"<Buffer>
    "Change pwd/current-dir
    " set autochdir " Automatically change current directory
    "autocmd BufEnter * cd %:p:h  "Auto change 'pwd' to current folder when enter a buffer
    set splitright  "Default split at right
    "set splitbelow  "Default split at right

"<Tag>
    set tags=./tags;,tags;./.git/tags;,../.git/tags


"Set syntax
autocmd FileType *.conf,*.config,*.cfg,*.ini set syntax=cfg


"IMPORTANT: FOR OPENNING LARGE FILE
let g:large_file_size = 10000000  "10MB
autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:large_file_size | set noswapfile | syntax clear | endif
autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) <= g:large_file_size | syntax clear | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          PERSISTENT FILE SETTINGS                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [  Backup Files  ]--------{
    set nobackup
    " set backup
    " set writebackup
    " " set backupcopy=yes  " Force backups to be copied from original, not renamed
    " " Create folder if not exists
    " set backupdir=~/do.not.move/vim_backup//
    " if !isdirectory(&backupdir)
    "    silent! call mkdir(&backupdir, 'p')
    " endif
" }


" [  Swap files  ]--------{
    set noswapfile  "Disable Swap files
    ""set swapfile  "Enable swap file
    "set directory=/tmp/vim_swap//    "set swp file directory.
    "" Create folder if not exists
    "if !isdirectory(&directory)
    "   silent! call mkdir(&directory, 'p')
    "endif
    "set updatecount=100     "save swp file every amount of characters
    "" ▼ update also check cursor-holds and other functions, bit expensive one.
    "set updatetime=100   "save swap file every amount of ms
" }


" [  Persistent undo  ]--------{
    if has("persistent_undo")
        set undofile "Save UNDO history to local files
        set undodir=~/do.not.move/undo//
        " Create folder if not exists
        if !isdirectory(&undodir)
           silent! call mkdir(&undodir, 'p')
        endif
    endif
" }

set history=1000


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    FOLD                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nofoldenable  "Cancel all folds when enter vim (faster)
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
"                              OTHER SETTINGS                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [  Builtin Autocomplete (omnifunc) ] ----{
    "autocmd FileType python set omnifunc=python3complete#Complete
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
