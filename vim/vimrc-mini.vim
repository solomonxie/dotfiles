" -------------[ MINIMUM VIMRC ]---------------
"
" MAINTAINER: Solomon Xie <solomonxiewise@gmail>
" Enviroment: Raspbian


" [  Import Modules  ]-----------{
    "source ~/dotfiles/vim/vimrc-plugins.vim
    "source ~/dotfiles/vim/vimrc-keymappings.vim
    "source ~/dotfiles/vim/vimrc-ui.vim
" }


" [  General Builtin Settings  ]-----------{
    "set spell spelllang=en,en_us,cjk  "Spell check [Ugly]
    set nocompatible  " be iMproved, required
    set nospell
    set ignorecase
    set ignorecase
    set smartcase
    set hidden
    set number
    set mouse=a
    set paste
    set showcmd
    set backspace=2
    set autoindent
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set encoding=utf8
    retab
" }


" [  Advanced Builtin Settings  ]-----------{
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
    "set t_Co=256   ">> Overwriting Alert !!
    "set background=dark   ">> Overwriting Alert !!
    "set cursorline  "Slow
    "set termguicolors   " -> !! NOT WORKING in Tmux through SSH

    syntax on  "Required for any colorscheme
    colorscheme default
    set background=dark
    set fillchars+=vert:\!  "Bar character for VERTical Split Pane
    set term=screen-256color
    set incsearch
    set hlsearch
    highlight Search guibg='Purple' guifg='NONE'
    highlight IncSearch gui=underline,bold guifg=White guibg=Red3
" }


" [  Swap files  ]--------{
    set swapfile    "enable swap file
    set directory=~/.vim/swap//    "set swp file directory.
    " ▼ update also check cursor-holds and other functions, bit expensive one.
    set updatetime=60000   "save swap file every amount of ms
    set updatecount=200     "save swp file every amount of characters
    if !isdirectory(&directory)
        silent! call mkdir(&directory, 'p')
    endif
" }


" [  Persistent undo  ]--------{
    set undofile "Maintain UNDO history between sessions
    set undodir=~/.vim/undo//
    if !isdirectory(&undodir)
       silent! call mkdir(&undodir, 'p')
    endif
" }


" [ KEY-BINDINGS ]-----------{
    let mapleader = ","
    nnoremap <C-o> <C-o>
    nnoremap <C-i> <C-i>
    noremap <Leader>o :browse oldfiles<CR>
    nnoremap gd gd
    vnoremap <Leader>gd y/<C-r>0<CR>
    vnoremap g* "1y:%s/<C-r>1//n<CR>
    nnoremap g* #<C-O>:%s///gn<CR>
    nnoremap <Left> <C-w>h
    nnoremap <Right> <C-w>l
    nnoremap <Up> <C-w>k
    nnoremap <Down> <C-w>j
    nnoremap <M-h> <C-w>h
    nnoremap <M-l> <C-w>l
    nnoremap <M-j> <C-w>j
    nnoremap <M-k> <C-w>k
    nnoremap <Leader>, <C-w>w
    nnoremap ( :tabnext<CR>
    nnoremap ) :tabprev<CR>
    nnoremap - :bprev<CR>:echo expand('%')<CR>
    nnoremap = :bnext<CR>:echo expand('%')<CR>
    nnoremap <C-]> g<C-]>
    nnoremap <Leader>tt g]
    noremap  <C-c> <Esc>:nohl<CR><ESC>
    nnoremap <ESC> <Esc>:nohl<CR><ESC>
    inoremap ,. <Esc>:nohl<CR><ESC>
    vnoremap ,. <Esc>:nohl<CR><ESC>
    nnoremap ,. <Esc>:nohl<CR><ESC>
    nnoremap <Space> viw
    nnoremap v<Space> viW
    nnoremap <Leader>aa :ggVG<CR>
    nnoremap <Leader>ay :%y+<CR>
    nnoremap <Leader>ad :%d+<CR>
    vnoremap r "1y:% s/<C-r>1/<C-r>1/gc<Left><Left><Left>*<BS>
    vnoremap f "1y :Rg <C-r>1<CR>
    nnoremap fw /<C-r>+<CR>
    inoremap <C-v> <C-r>0
    nnoremap <Leader>v v$h
    nnoremap <Leader>0 v^
    nnoremap Y yiw
    noremap <Leader>s :vsplit<CR><C-w>l
    noremap <Leader>q :bdelete<CR><ESC>
    nnoremap <Leader>tc :tabnew<CR>
    nnoremap <Leader>tq :windo bdelete<CR>
    noremap <A-c> <C-w>c
    vnoremap <Leader>y "+y
    vnoremap <CR> "+y
    noremap <Leader>p "+p
    nnoremap \\ :echo expand('%')<CR>
    nnoremap  n :set hlsearch<cr>n
    nnoremap  N :set hlsearch<cr>N
    nnoremap  / :set hlsearch<cr>/
    nnoremap  ? :set hlsearch<cr>?
    nnoremap  * #:set hlsearch<cr>
    nnoremap  # *:set hlsearch<cr>
    nnoremap  !! /<C-r>+<CR>
" }
