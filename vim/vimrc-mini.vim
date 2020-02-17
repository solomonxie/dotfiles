" -------------[ MINIMUM VIMRC ]---------------
"
" MAINTAINER: Solomon Xie <solomonxiewise@gmail>
" Enviroment: Raspbian
"
" Performance:
"   vim --startuptime /tmp/vim-startup-time.log +qall && cat /tmp/vim-startup-time.log |sort -nrk 2
"   "or
"   :Startuptime


" [  Import Modules  ]-----------{
    "source ~/dotfiles/vim/vimrc-plugins.vim
    source ~/dotfiles/vim/vimrc-keymappings.vim
    "source ~/dotfiles/vim/vimrc-ui.vim
" }


" [  Plugins Manager vim-plug  ]-----------------------------------{
    call plug#begin('~/.vim/plugged')
        " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        " Plug 'junegunn/fzf.vim'
        " Plug 'tpope/vim-obsession'  "For Tmux to restore VIM sessions
        " Plug 'tweekmonster/startuptime.vim'   "VIM loading analysis
    call plug#end()
    "[Plugin Settings]
    "...
" }



" [  General Builtin Settings  ]-----------{
    set nocompatible   " be iMproved, required
    "set spell spelllang=en,en_us,cjk  "Spell check [Ugly]
    set nospell
    set ignorecase "Case Insensitive
    set ignorecase   "搜索时忽略大小写
    set smartcase  "搜索时如果输大写, 就不再忽略大小写
    set hidden " 设置Buffer缓冲区允许不保存时切换buffer
    set number "show line number
    set mouse=a  "设置鼠标滚动为All，即在tmux中的vim也能滚动 （但是选中文字自动会进入Visual模式）
    set paste   "Avoid pasting chaos
    set showcmd " show keypress at right-bottom
    set backspace=2 "backspace over everything in insert mode
    set autoindent "换行时自动缩排 同时对应的还有其它两种模式 smartindent, cindent
    set tabstop=4 "设定tab宽度为4个字符
    set shiftwidth=4 "设定自动缩进为4个字符
    set expandtab "用space替代tab的输入 取消的话 就用set noexpandtab "不用space替代tab的输入
    set encoding=utf8  "设置默认编码
    retab "打开文件时自动转换所有tab为空格
" }


" [  Advanced Builtin Settings  ]-----------{
    "<Folding>
    set foldmethod=manual  "manual|syntax
    set nofoldenable  "Disable fold by default (press zE if the folding marks exist)
    set foldclose=all          " 设置为自动关闭折叠
    set foldlevel=1        " 设置折叠层数
    set foldlevelstart=99       " 打开文件是默认不折叠代码
    " set foldenable              " 开始折叠
    " set foldmethod=syntax       " 设置语法折叠
    " set foldnestmax=1
    " set foldcolumn=0            " 设置折叠区域的宽度
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
    set directory=/tmp    "set swp file directory.
    set updatecount=200     "save swp file every amount of characters
    " ▼ update also check cursor-holds and other functions, bit expensive one.
    set updatetime=60000   "save swap file every amount of ms
" }


" [  Persistent undo  ]--------{
    set undofile "Maintain UNDO history between sessions
    set undodir=/tmp/undo
    if !isdirectory(&undodir)
       silent! call mkdir(&undodir, 'p')
    endif
" }

