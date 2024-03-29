" -------------[ STANDARD VIMRC ]---------------
"
" Enviroment: MacOS Sierra / Raspbian / Ubuntu
"
" Dependencies:
"     " [Plugins Manager: Vim-Plug]
"       $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"     " [Plug  dependencies]
"       $ brew install ctags
"       $ brew install --HEAD universal-ctags/universal-ctags/universal-ctags
"
" Commands:
"     - Install plugins: ":PlugInstall"
"     - Check current filetype: ":echo &filetype"
"     - Build current file: "Ctrl-u"
"
" Performance:
"   vim --startuptime /tmp/vim-startup-time.log +qall && cat /tmp/vim-startup-time.log |sort -nrk 2
"   "or
"   :Startuptime



" [  Variables  ]-----------{
    let has_mac = has('mac')
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
" }



" [  Plugins Manager vim-plug  ]
call plug#begin('~/.vim/plugged')
    " [    UI / Appearence     ]

        "<STATUS-BAR>
            Plug 'vim-airline/vim-airline'
            Plug 'vim-airline/vim-airline-themes'

        "<Syntax Highlighting>
            if has_mac
                Plug 'vim-syntastic/syntastic' "Syntax checker for all languages
                Plug 'hdima/python-syntax'   "Most stable highlighting
            endif

        "<Window>

    " [    Browsing   ]

        "<Fuzzy File Search>
            " <fzf>
            Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            Plug 'junegunn/fzf.vim'

            "<NetRW>
            Plug 'tpope/vim-vinegar'      "Netrw enhancement

        "<NERDTREE>
            if has_mac
                Plug 'scrooloose/nerdtree'          " File tree manager
                Plug 'jistr/vim-nerdtree-tabs'      " enhance nerdtree's tabs
                Plug 'ryanoasis/vim-devicons'       " add beautiful icons besides files
            endif

        "<Tags>
            if has_mac
                Plug 'majutsushi/tagbar'   " (ctags required)
            endif

        "<Git>
            Plug 'jreybert/vimagit'  "Much easier with Git

    " [   INSERTION    ]

        "<Autocomplete>
            "[Snippets]  -> Python required
                Plug 'SirVer/ultisnips', {'on':['InsertEnter']} " Track the engine.
                Plug 'honza/vim-snippets' " Snippets are separated from the engine.
            "[Deoplete]
            if has_mac
                Plug 'Shougo/deoplete.nvim'
                Plug 'roxma/vim-hug-neovim-rpc'  ">> VIM only
                Plug 'roxma/nvim-yarp'    " Yet Another Remote Plugin Framework for Neovim
                Plug 'zchee/deoplete-jedi'    " Python completion source
                Plug 'Shougo/deoplete-clangx'   " C/C++ completion source
            endif

            "[Comment]
            Plug 'scrooloose/nerdcommenter'

        "<Bracket Closing>
            Plug 'jiangmiao/auto-pairs' "Smartest

        "<Indentation>
            Plug  'Yggdroot/indentLine'    "Beautiful indent lines

    " [   SESSION    ]
        Plug 'tpope/vim-obsession'  "For Tmux to restore VIM sessions

    " [   PERFORMANCE    ]
        Plug 'tweekmonster/startuptime.vim'   "VIM loading analysis

    " [  Historical Abandoned Plugins  ]
        "Window
            "Plug 'blueyed/vim-diminactive'  "not dim Indent lines
        "Folding
            "Plug 'tmhedberg/SimpylFold'   "improving folding
        "Completion
            "Plug 'valloric/youcompleteme'    "hard to build
            "Plug 'davidhalter/jedi-vim'      "complicated, need to work with others
            "Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}   "not working
            "Plug 'rkulla/pydiction'   " not work as expected
            "Plug 'ervandew/supertab'
        "Indentation
            "Plug 'nathanaelkane/vim-indent-guides'
        "Brackets
            "Plug 'tpope/vim-surround'  "Barely working
            "Plug 'Townk/vim-autoclose' "Fair, but not working for some files
        "Snippets
            "Plug 'MarcWeber/vim-addon-mw-utils'
            "Plug 'tomtom/tlib_vim'
            "Plug 'garbas/vim-snipmate'
            "Plug 'honza/vim-snippets' "some common snippets (python required)
        "Git
            "Plug 'tpope/vim-fugitive'    "Commands to do Git
            "Plug 'easymotion/vim-easymotion'
        "Markdown
            "Plug 'JamshedVesuna/vim-markdown-preview' "Not live previewing
        "File Browsing
            "Plug 'Xuyuanp/nerdtree-git-plugin'  " display git status within Nerdtree
            "Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " enhance devicons
            "Plug 'wincent/command-t'    "VIM only (Ruby required)
            "Plug 'justinmk/vim-dirvish'  "Netrw enhancement
        "Color Scheme
            "Plug 'chriskempson/base16-vim'   "Ugly !!
            "Plug 'jpo/vim-railscasts-theme'  "Ugly !
            "Plug 'NLKNguyen/papercolor-theme'   "No python support
        "Status Bar
            "Plug 'itchyny/lightline.vim' "beautiful status line
            "Plug 'Lokaltog/vim-powerline' "fancy status line (python required)
        "Syntax Highlighting
            "Plug 'vim-python/python-syntax'
            "Plug 'vitiral/vim-python'  "Not working
            "Plug 'numirias/semshi'    "Not working
            "Plug 'pfdevilliers/Pretty-Vim-Python'   "not working
            "-> Python-mode: (More errors, too many builtin plugins)
            "Plug 'python-mode/python-mode'    "Deprecated
            "Plug 'python-mode/python-mode', { 'branch': 'develop' }
call plug#end()


" [  Lazy Load Plugins  ]-----------{
    "<UltiSnips>  -> Very slow
    "augroup load_us
    "    autocmd!
    "    autocmd InsertEnter * call plug#load('ultisnips') | autocmd! load_us
    "augroup END
" }


" [  General Builtin Settings  ]-----------{
    set nocompatible   " be iMproved, required
    "set spell spelllang=en,en_us,cjk  "Spell check [Ugly]
    "set nospell
    set ignorecase "Case Insensitive
    set ignorecase   "搜索时忽略大小写
    set smartcase  "搜索时如果输大写, 就不再忽略大小写
    set hidden " 设置Buffer缓冲区允许不保存时切换buffer
    set number "show line number
    set mouse=a  "设置鼠标滚动为All，即在tmux中的vim也能滚动 （但是选中文字自动会进入Visual模式）
    "set paste   "设置可以直接用ctrl+c ctrl+v复制粘贴 其实没什么区别 只不过不用在insert模式而已
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
    "<Taging>
    set tags=tags  "Plugin: Ctags
    "<Folding>
    set foldenable              " 开始折叠
    set foldmethod=syntax       " 设置语法折叠
    set foldnestmax=1
    set foldcolumn=0            " 设置折叠区域的宽度
    setlocal foldlevel=1        " 设置折叠层数
    set foldlevelstart=99       " 打开文件是默认不折叠代码
    "set foldclose=all          " 设置为自动关闭折叠

    "<Buffer>
        autocmd BufEnter * cd %:p:h  "进入Buffer后自动把pwd改为文件所在目录

    "<FileType>
    filetype plugin on    " [essential]
    filetype plugin indent off
" }


" [  Builtin UI / Color Scheme  ]---------{
    " <Basic Settings>
        set t_Co=256   ">> Overwriting Alert !!
        set background=dark   ">> Overwriting Alert !!
        set cursorline  "Highlighting current line
        set fillchars+=vert:\!  "Bar character for VERTical Split Pane
        autocmd WinEnter * set cursorline
        autocmd WinLeave * set nocursorline

    " <Syntax Highlighting>  --> Overwriting Alert!
        syntax enable

    " <Color Scheme>  --> Overwriting Alert!
        if has_mac
            set termguicolors   ">> Not compatiple with many themes
            "colorscheme material-monokai ">> Super slow, has block color comment
            colorscheme gruvbox ">> grubox is slow for old machine
        else
            "colorscheme delek  "Builtin colorscheme
            colorscheme monokai "Fast (sickill/vim-monokai)
            "Text bg-color is not working properly with Rpi
            highlight Normal ctermbg=NONE
            highlight nonText ctermbg=NONE
        endif

    " <Highlight Settings>  --> Overwriting Alert!
        "hi! VertSplit guifg=red guibg=blue term=None
        "hi Normal ctermbg=White ctermfg=Black guifg=Black guibg=White

    " <Spell Check>
        autocmd BufRead,BufNewFile *.txt,*.md setlocal spell spelllang=en,en_us,cjk
        autocmd FileType gitcommit setlocal spell spelllang=en,en_us,cjk

    " <NetRW File Tree>
        set autochdir
        let g:netrw_browse_split=0   "[Essential]
        let g:netrw_liststyle=3   "List Style  3:Tree listing
        let g:netrw_banner=0  "Hide banner
        let g:netrw_altv = 2
        let g:netrw_winsize = 25
        let g:netrw_hide=1
        "let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'
        let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
        "autocmd FileType netrw setl bufhidden=wipe
        "autocmd FileType netrw setl bufhidden=delete

    " <Length Marker>
        "> Warning color
        "highlight OverLength ctermbg=red ctermfg=white
        "match OverLength /\%81v.\+/
        "> Warning Column
        "let &colorcolumn=join(range(81,999),",")
        "let &colorcolumn="80,".join(range(400,999),",")
        "> or
        "set colorcolumn=80
        "highlight ColorColumn guibg=#155460
        "> or
        "highlight ColorColumn ctermbg=grey
        "> or
        "highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" }


" [  Builtin Autocomplete (omnifunc) ] ----{
        "au FileType python setl ofu=pythoncomplete#CompletePHP
        "au FileType php setl ofu=phpcomplete#CompletePHP
        "au FileType ruby,eruby setl ofu=rubycomplete#Complete
        "au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
        "au FileType c setl ofu=ccomplete#CompleteCpp
        "au FileType css setl ofu=csscomplete#CompleteCSS
" }


" [   Key Mappings / Bindings   ]----------------------------{
    "<Leader key>
        let mapleader = ','

    "<Files>
        "Save file
        noremap  <leader>s <ESC>:w<CR><ESC>
        "Save & Exit
        noremap  <C-x> <ESC>:x<CR><ESC>
        noremap <leader>j :jumps<CR>

    "<Edits> -> <Tab> default set to <C-i>, but remap not working
        noremap  <C-c> <Esc>:nohl<CR><ESC>
        inoremap <C-c> <Esc>
        nnoremap <space> viw
        "inoremap jj <esc>
        map q <NOP>
        inoremap <leader>r q
        nnoremap <leader>aa :ggVG<CR>
        nnoremap <leader>ay :%y+<CR>
        nnoremap <leader>ad :%d+<CR>
        nnoremap g- ''

    "<Splits>
        noremap S :vsplit<CR><C-w>l<ESC>:bn<CR><ESC>
        nnoremap <leader>ve :vsplit ~/dotfiles/vim/vimrc<CR>

    "<Buffer>
        "Close buffer
            "noremap <leader>bq :bd<CR><ESC>
            noremap <leader>bd :bp\|bd #<CR>
        "Move between buffers
            noremap <leader>h :bp<CR>
            noremap <leader>l :bn<CR>
        "History search
            "noremap <leader><C-h> :browse oldfiles<CR>
            "noremap <leader><C-h> :History<CR>

    "<Windows>
        noremap m <C-w>
        "noremap H <C-w>h
        "noremap L <C-w>l
        noremap <TAB> <C-w>w
        noremap <S-TAB> <C-w>h
        "noremap <leader>o <C-w>o
        "noremap <leader>qw <C-w>c

    "<Appearence>
        noremap <leader>z :setlocal spell spelllang=en,en_us,cjk<CR>
        noremap <leader>Z :setlocal nospell<CR>

    "<Clipboard>
        " 复制到系统剪切板
        noremap <leader>y "+y
        " 从系统剪切板中粘贴到当前位置
        noremap <leader>p "+p
        noremap <leader>" :reg<CR>

    "<Folding>
        "noremap <space> za
        noremap <leader><return> zR
        noremap <leader><space> zM
        " >> 用空格键来开关折叠
        "nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
        "nnoremap <return> za

    "<Highlights> -> 当输入查找命令时，再启用高亮
        noremap n :set hlsearch<cr>n
        noremap N :set hlsearch<cr>N
        noremap / :set hlsearch<cr>/
        noremap ? :set hlsearch<cr>?
        noremap * *:set hlsearch<cr>

    "<Builds/Compiles>----{
        " Get current filetype -> :echo &filetype or as variable &filetype
        " [ Builds / Compiles / Interpretes  ]
        "<C/C++ Compiler>  -> Compile & run
        autocmd FileType c noremap <buffer> <C-u> :w<CR>:!gcc % && ./a.out <CR>
        autocmd FileType cpp noremap <buffer> <C-u> :w<CR>:!g++ % && ./a.out <CR>
        "<Python Interpreter>
        autocmd FileType python noremap <buffer> <C-u> :w<CR>:!python % <CR>
        "<Bash Script>
        autocmd FileType sh noremap <buffer> <C-u> :w<CR>:!bash % <CR>
        "<RCs> (Configs)
        autocmd FileType vim,tmux noremap <buffer> <C-u> :w<CR><ESC>:source % <CR>
        autocmd FileType zsh noremap <buffer> <C-u> :w<CR>:!source % <CR>
        "<Executable>  -> conflict with above
        ""noremap <buffer> <C-u> :!./% <CR>
        ""noremap <buffer> <C-u> :! %:p <CR>
    " }

    "<NetRW> -> (Lexplore/Vexplore/Texplore/Explore/Sexplore/edit.)
        "nnoremap <leader>f :Lexplore<CR>
        "nnoremap <leader>f :Explore<CR>
        "nnoremap <leader>f :edit.<CR>

    "<Omni Autocomplete> -> Vim自带的Omni自动补全
        "inoremap <C-d> <C-x><C-l>
        "inoremap ' ''<Esc>i
        "inoremap " ""<Esc>i
        "inoremap ( ()<Esc>i
        "inoremap [ []<Esc>i
        "inoremap { {}<Esc>i

    "<Plugins>------------------------------------{
        "[Plugin Manager]
            noremap <leader>I :PlugInstall<CR>

        "[vim-obsession]
            " Record session >> ":mksession" can't overwite
            noremap <leader>S :Obsession /tmp/obsession.vim<CR><ESC>
            " Restore session
            noremap <leader>R :source /tmp/obsession.vim<CR><ESC>

        "[vimagit]
            "let g:magit_show_magit_mapping='<leader>G'
            let g:magit_show_magit_mapping='<leader>g'

        "[tagbar] ->  "*"->open all folds; "="->close all folds
            "noremap <leader>t :TagbarToggle<CR>=<ESC>
            noremap <leader>t :TagbarOpen<CR>
            noremap T :TagbarOpen<CR>

        "[Auto-pair]
        "imap <C-d> <Meta>
        "imap <C-d>e <M-e>

        "[fzf]
            nnoremap <leader>// :Files %:p:h<CR>
            nnoremap <leader>/l :Lines<CR>
            nnoremap <leader>/h :History<CR>
            nnoremap <leader>/c :History:<CR>
            nnoremap <leader>/s :History/<CR>
            nnoremap <leader>/n :Snippets<CR>
            "nnoremap <leader>p/ :Files ..
            "nnoremap <leader>color/ :Colors
            "nnoremap <leader>k/ :Maps<CR>
        "[Command-T File Searching]
            "nnoremap <leader>/ :CommandT<CR>
            "nnoremap <leader>c :CommandT<CR>

        "[Nerdtree]
            "nnoremap <leader>f :NERDTreeFocus<CR>
            "nnoremap <leader>f :NERDTreeToggle<CR>
            " Add '%' for changing root accordingly
            nnoremap <leader>f :NERDTree %<CR>
        "[Nerdtree Tabs]
            " Shift Tabs
            "nnoremap <C-h> gt
            "nnoremap <C-l> gT
            " New Tab
            "nnoremap <leader>t :tabe<CR>
            " Close Tab
            "nnoremap <leader>c :tabc
    " }
" }



" [  Search Highlighting  ]-----------{
    set incsearch    "即时显示匹配结果
    " >>
        highlight Search guibg='Purple' guifg='NONE'
        highlight IncSearch gui=underline,bold guifg=White guibg=Red3
        "highlight IncSearch ctermbg=black ctermfg=yellow
    " 鼠标无动作时取消高亮
        autocmd cursorhold * set nohlsearch
    " 括号匹配自动高亮
        "highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE"
" }



" [  Abbreviations  ]--------{
    " Test
        iabbrev waht what
        iabbrev tehn then
" }


" [  Swap files  ]--------{
    set swapfile    "enable swap file
    set directory=/tmp    "set swp file directory.
    set updatecount=20     "save swp file every amount of characters
    " ▼ update also check cursor-holds and other functions, bit expensive one.
    set updatetime=4000   "save swap file every amount of ms
" }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==============================PLUGIN SETTINGS=================================
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" <Vim-Obsession>--------{
    " Auto record session on VIM's exit (No space between multiple files)
        "autocmd VimLeave * :Obsession /tmp/obsession.vim
        "autocmd VimLeave *.py,*.json :Obsession /tmp/obsession.vim
        function! AutoObsession()
            if bufnr('%') >= 3
                :Obsession /tmp/obsession.vim
            endif
        endfunction
        autocmd VimLeave * call AutoObsession()
" }

" <UltiSnips>--------{
    " Trigger configuration.
    " Do not use <tab> if you use YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsJumpForwardTrigger="<C-n>"
    let g:UltiSnipsJumpBackwardTrigger="<C-p>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    " Specify snippets locations
    let g:UltiSnipsSnippetDirectories=["~/.vim/bundle/ultisnips/UltiSnips","~/dotfiles/snippets"]
" }


" <IndentLine>--------{
    let g:indentLine_enabled = 1
    let g:indentLine_char='│'
    let g:indentLine_conceallevel = 2
    let g:indentLine_color_term = 239
    let g:indentLine_concealcursor = 'inc'
    "let g:indentLine_setColors = 0
    "let g:indentLine_setConceal = 0
    autocmd Filetype json let g:indentLine_enabled = 0  ">> Huge bug for JSON input
" }


" <pydiction>-------------{
    "let g:pydiction_location = '$HOME/.vim/plugged/pydiction/complete-dict'
    "let g:pydiction_menu_height = 7
" }

" <vim-markdown-preview>-------------{
    let vim_markdown_preview_github=1
" }

" <Deoplete>--------------{
    if has_mac
    " Enable at startup
        let g:deoplete#enable_at_startup = 1
    " Set multiple options
        call deoplete#custom#option({
        \ 'auto_complete_delay': 0,
        \ 'smart_case': v:true,
        \ })
    " Deoplete-jedi
        let g:deoplete#sources#jedi#enable_typeinfo = 0
        let g:deoplete#sources#jedi#show_docstring = 0
    " deoplete-clangx
        " Change clang binary path
        "call deoplete#custom#var('clangx', 'clang_binary', '/usr/local/bin/clang')
        " Change clang options
        "call deoplete#custom#var('clangx', 'default_c_options', '')
        "call deoplete#custom#var('clangx', 'default_cpp_options', '')
    endif
" }


" <SimpylFold>------------{
    "let g:SimpylFold_docstring_preview = 1
" }

" <Tagbar>--------------{
    let g:tagbar_left = 0  "Show tagbar on right
    let g:tagbar_autofocus = 1   "Focus on tagbar window when open
    let g:tagbar_autoclose = 1   "Close tagbar window when select tag
    "let g:tagbar_autoshowtag = 0
    "let g:tagbar_expand = 0
    "let g:tagbar_singleclick = 1
    "let g:tagbar_compact = 1
    "let g:tagbar_indent = 1
    "let g:tagbar_show_visibility = 1
" }

" <Python-syntax>------------------{
    if has_mac
        let g:python_highlight_all = 1
    endif
" }

" Jedi Settings ---------------------{
    let g:jedi#force_py_version=2.7
" }


" <Vim-Indent-Guides>----------------------{
    "let g:indent_guides_enable_on_vim_startup = 1
    "set ts=1 sw=1 et
    "let g:indent_guides_start_level=2
    "let g:indent_guides_size=1
    "hi IndentGuidesOdd  ctermbg=black
    "hi IndentGuidesEven ctermbg=darkgrey
" }


" <Command-T fuzzy search>----------------{
    "let g:CommandTMaxDepth = 10
    "let g:CommandTMaxFiles=2000
    "let g:CommandTSuppressMaxFilesWarning = 1
    "set wildignore+=".*, *.dat, *.o, *.pyc, */.git, *.pdf, *.app, *.jpg, *.png, *.gif, *.doc, *.docx"
" }

" <fzf fuzzy search>-------------------------{
    "let g:fzf_action = { 'ctrl-e': 'edit' }
    " Default fzf layout
        " - down / up / left / right
        let g:fzf_layout = { 'down': '~40%' }
    " In Neovim, you can set up fzf window using a Vim command
    " - enew / -tabnew / 10split enew
        "let g:fzf_layout = { 'window': 'enew' }
        "let g:fzf_layout = { 'window': '-tabnew' }
        "let g:fzf_layout = { 'window': '10split enew' }
" }


" <vim-diminactive>-----------{
    "let g:diminactive_use_colorcolumn = 2
    "let g:diminactive_use_syntax = 0
" }

" <Status-Line>-----------{
    " @airline
        set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩
        let g:airline#extensions#tabline#enabled = 1   " 是否打开tabline
    "这个是安装字体后 必须设置此项"
        let g:airline_powerline_fonts = 1
        set laststatus=2  "永远显示状态栏
        let g:airline_theme='bubblegum' "选择主题
        let g:airline#extensions#tabline#enabled=1  "显示窗口tab和buffer
        "let g:airline#extensions#tabline#left_sep = ' '  "separater
        "let g:airline#extensions#tabline#left_alt_sep = '|'  "separater
        "let g:airline#extensions#tabline#formatter = 'default'  "formater
        let g:airline_left_sep = '▶'
        let g:airline_left_alt_sep = '❯'
        let g:airline_right_sep = '◀'
        let g:airline_right_alt_sep = '❮'
        "let g:airline_symbols.linenr = '¶'
        "let g:airline_symbols.branch = '⎇'
    " @lightline
        "set laststatus=2 " startup the lightline.vim
        "let g:lightline = { 'colorscheme': 'powerline', }
        "set status-line's color scheme
    " @powerline
        "set laststatus=2
        "set t_Co=256
        "let g:Powerline_symbols= 'unicode'
        "set encoding=utf8
" }

" <nerdcommenter>------------------{
    "" Add spaces after comment delimiters by default
    "let g:NERDSpaceDelims = 1
    "" Use compact syntax for prettified multi-line comments
    "let g:NERDCompactSexyComs = 1
    "" Align line-wise comment delimiters flush left instead of following code indentation
    "let g:NERDDefaultAlign = 'left'
    "" Set a language to use its alternate delimiters by default
    "let g:NERDAltDelims_java = 1
    "" Add your own custom formats or override the defaults
    "let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
    "" Allow commenting and inverting empty lines (useful when commenting a region)
    "let g:NERDCommentEmptyLines = 1
    "" Enable trimming of trailing whitespace when uncommenting
    "let g:NERDTrimTrailingWhitespace = 1
    "" Enable NERDCommenterToggle to check all selected lines is commented or not
    "let g:NERDToggleCheckAllLines = 1
" }


" Plugin Settings Nerdtree -------------------{
    ">> Basic settings
        let g:NERDTreeChDirMode = 2  "Change current folder as root

    ">> UI settings
        let NERDTreeQuitOnOpen=1   " Close NERDtree when files was opened
        let NERDTreeMinimalUI=1    " Start NERDTree in minimal UI mode (No help lines)
        let NERDTreeDirArrows=1    " Display arrows instead of ascii art in NERDTree
        let NERDTreeChDirMode=2    " Change current working directory based on root directory in NERDTree
        let g:NERDTreeHidden=1     " 不显示隐藏文件
        let NERDTreeWinSize=30     " Initial NERDTree width
        let NERDTreeAutoDeleteBuffer = 1  " Auto delete buffer deleted with NerdTree
        "let NERDTreeShowBookmarks=0   " Show NERDTree bookmarks
        let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '__pycache__']   " Hide temp files in NERDTree
        "let g:NERDTreeShowLineNumbers=1  " 显示菜单上行号
    " 打开vim时如果没有文件自动打开NERDTree
        "autocmd vimenter * if !argc()|NERDTree|endif
    " 或, 自动开启Nerdtree
        "autocmd vimenter * NERDTree
    " 当NERDTree为剩下的唯一窗口时自动关闭
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    " 设置树的显示图标
        let g:NERDTreeDirArrowExpandable = '▸'
        let g:NERDTreeDirArrowCollapsible = '▾'

    ">> NERDTREE-GIT
    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
    \ }

    ">> NERDTree-Tabs
        "let g:nerdtree_tabs_open_on_console_startup=1 "设置打开vim的时候默认打开tabs
    ">> Nerdtree-devicons
        "set guifont=DroidSansMono_Nerd_Font:h11
    ">> Nerdtree-syntax-highlighting
        "let g:NERDTreeDisableFileExtensionHighlight = 1
        "let g:NERDTreeDisableExactMatchHighlight = 1
        "let g:NERDTreeDisablePatternMatchHighlight = 1
        "let g:NERDTreeFileExtensionHighlightFullName = 1
        "let g:NERDTreeExactMatchHighlightFullName = 1
        "let g:NERDTreePatternMatchHighlightFullName = 1
        "let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
        "let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
        "let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
" }





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==============================FUNCTION CALLINGS=================================
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call Builtin_settings_general()
