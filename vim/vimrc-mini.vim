" -------------[ MINIMUM VIMRC ]---------------
"
" MAINTAINER: Solomon Xie <solomonxiewise@gmail>
" Enviroment: Raspbian


" [  Import Modules  ]-----------{
    "source ~/dotfiles/vim/vimrc-plugins.vim
    source ~/dotfiles/vim/vimrc-keymappings.vim
    "source ~/dotfiles/vim/vimrc-ui.vim
" }


" [  General Builtin Settings  ]-----------{
    set nocompatible   " be iMproved, required
    "set spell spelllang=en,en_us,cjk  "Spell check [Ugly]
    set nospell
    set ignorecase "Case Insensitive
    set ignorecase
    set smartcase
    set hidden
    set number
    set mouse=a
    set paste   "Avoid pasting chaos
    set showcmd " show keypress at right-bottom
    set backspace=2 "backspace over everything in insert mode
    set autoindent
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set encoding=utf8
    retab
" }


" [  Advanced Builtin Settings  ]-----------{
    "<Folding>
    set foldmethod=manual  "manual|syntax
    set nofoldenable  "Disable fold by default (press zE if the folding marks exist)
    set foldclose=all
    set foldlevel=1
    set foldlevelstart=99
    " set foldenable
    " set foldmethod=syntax
    " set foldnestmax=1
    " set foldcolumn=0
" }


" [  UI / Color Scheme  ]---------{
    " <Basic Settings>
        set t_Co=256   ">> Overwriting Alert !!
        set background=dark   ">> Overwriting Alert !!
        "set cursorline  "Highlighting current line
        set fillchars+=vert:\!  "Bar character for VERTical Split Pane

    " <Color Scheme>  --> Overwriting Alert!
        "set termguicolors   " -> !! NOT WORKING in Tmux through SSH
        set term=screen-256color
        " colorscheme monokai "Fast (sickill/vim-monokai)
        colorscheme badwolf "Built-in
        highlight Normal ctermbg=NONE
        highlight nonText ctermbg=NONE

    " [  Search Highlighting  ]-----------{
        "
            set incsearch
            set hlsearch
        " >>
            highlight Search guibg='Purple' guifg='NONE'
            highlight IncSearch gui=underline,bold guifg=White guibg=Red3
    " }

    "Set syntax
    autocmd FileType *.conf,*.config,*.cfg,*.ini set syntax=cfg
" }


" [  Swap files  ]--------{
    set swapfile    "enable swap file
    set directory=~/.vim/swap//    "set swp file directory.
    if !isdirectory(&directory)
        silent! call mkdir(&directory, 'p')
    endif
    set updatecount=200     "save swp file every amount of characters
    " ▼ update also check cursor-holds and other functions, bit expensive one.
    set updatetime=60000   "save swap file every amount of ms
" }


" [  Persistent undo  ]--------{
    set undofile "Maintain UNDO history between sessions
    set undodir=~/.vim/undo//
    if !isdirectory(&undodir)
       silent! call mkdir(&undodir, 'p')
    endif
" }

