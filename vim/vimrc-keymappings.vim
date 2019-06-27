"-----------------------------------------------------------------
"           __     ___             _  __                         -
"           \ \   / (_)_ __ ___   | |/ /___ _   _ ___            -
"            \ \ / /| | '_ ` _ \  | ' // _ \ | | / __|           -
"             \ V / | | | | | | | | . \  __/ |_| \__ \           -
"              \_/  |_|_| |_| |_| |_|\_\___|\__, |___/           -
"                                           |___/                -
"----------------------------GENERATED-BY-FIGLET------------------

" [   Key Mappings / Bindings   ]----------------------------{
    "<Leader key>
        let mapleader = ","
        let maplocalleader = "\\"

    "<Undefined>
        "noremap - <NOP>
        "noremap = <NOP>
        nnoremap <C-o> <C-o>
        nnoremap <C-i> <C-i>

    "<Files>
        "{Save file}
        "noremap  <Leader>s <ESC>:w<CR><ESC>
        "{Save & Exit}
        " noremap  <C-x> <ESC>:x<CR><ESC>
        "noremap <Leader>j :jumps<CR>
        noremap <Leader>o :browse oldfiles<CR>
        command! OpenThisOnMac :silent exec "!open %"<CR>
        command! OpenAllInThisDir :next *
        "{Change pwd/Current Directory to be same with buffer}
        command! CDToCurrentDir :cd %:p:h
        "{Open with other applications}
        if has('mac')
            command! OpenWithVSCode :silent !/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code %
            command! OpenWithSublime :silent !/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl %
        endif

    "<Navigation>
        "{Go-next-call}
            "nnoremap m yiw/<C-r>0<CR>
        "{Go-definition}
            nnoremap gd gd
            vnoremap <Leader>gd y/<C-r>0<CR>
        "{Highlight all current word}
            "nnoremap * #
            "nnoremap # *
        "{Jump to parent bracket/level}
            "nnoremap <C-[> [{
        "{Move between Buffers}
            "nnoremap <Space> :bnext<CR>
            nnoremap <Leader>h :bprev<CR>
            nnoremap <Leader>l :bnext<CR>
            nnoremap - :bprev<CR>
            nnoremap = :bnext<CR>
        "{Move between Windows}
            nnoremap <Left> <C-w>h
            nnoremap <Right> <C-w>l
            nnoremap <Up> <C-w>k
            nnoremap <Down> <C-w>j
            noremap <M-h> <C-w>h
            noremap <M-l> <C-w>l
            noremap <M-j> <C-w>j
            noremap <M-k> <C-w>k
            nnoremap <Leader>, <C-w>w
        "{Move between Tabs}
            nnoremap ( :tabnext<CR>
            nnoremap ) :tabprev<CR>
            "nnoremap g9 :tabfirst<CR>
            "nnoremap g0 :tablast<CR>
        "{Move between Tags}
            "nnoremap <C-]> <C-]>
            "nnoremap <C-[> <C-t>
            nnoremap <Leader>tt g]

    "<Edit> -> <Tab> default set to <C-i>, but remap not working
        noremap  <C-c> <Esc>:nohl<CR><ESC>
        inoremap <C-c> <Esc>
        nnoremap <Space> viw
        nnoremap <M-Space> vip
        "
        "inoremap jj <esc>
        "map q <NOP>
        "noremap <Leader>,r q
        nnoremap <Leader>aa :ggVG<CR>
        nnoremap <Leader>ay :%y+<CR>
        nnoremap <Leader>ad :%d+<CR>
        nnoremap Y yiw
        "nnoremap g- ''
        "{Replace-all}
        "noremap  <Leader>ra "1y:% s/<C-r>1/<C-r>1/gc<Left><Left><Left>
        vnoremap f "1y:% s/<C-r>1/<C-r>1/gc<Left><Left><Left>
        "{ctrl-v paste reg:0}
        inoremap <C-v> <C-r>0
        "{Select from cursor to the end}
        nnoremap <Leader>v v$h
        nnoremap <Leader>0 v^
        "{Capitalize}
        vnoremap U U
        "{Lowercase}
        vnoremap u u
        "{Switch case}
        vnoremap ~ ~
        "{Register}
        "noremap <Space> "
        "noremap <Leader><Space> :registers<CR>

    "<Split>
        "noremap S :vsplit<CR><C-w>l<ESC>:bn<CR><ESC>
        noremap S :vsplit<CR><C-w>l
        "{vimrc-edit}
        "nnoremap <Leader>ve :tabnew<CR>:source ~/dotfiles/vim/workspace.vim<CR>:tabnext<CR>
        function! LoadVimrc()
            :tabnew
            :source ~/dotfiles/vim/workspace.vim
        endfunction
        "nnoremap <Leader>ve :call LoadVimrc()<CR>
        command! Vimrc :call LoadVimrc()
        "nnoremap <Leader>ve :split<CR><C-w>j<ESC>:e ~/dotfiles/vim/vimrc<CR>
        "{vimrc-keymapping}
        "nnoremap <Leader>vk :split<CR><C-w>j<ESC>:e ~/dotfiles/vim/vimrc-keymappings<CR>
        "{vimrc-plugin}
        "nnoremap <Leader>vp :split<CR><C-w>j<ESC>:e ~/dotfiles/vim/vimrc-plugins<CR>
        "{vimrc-ui}
        "nnoremap <Leader>vu :split<CR><C-w>j<ESC>:e ~/dotfiles/vim/vimrc-ui<CR>

    "<Buffer>
        "{Close buffer}
            "noremap <Leader>q :windo bdelete<CR><ESC>
            noremap <Leader>q :bdelete<CR><ESC>
            "noremap <Leader>q :bprev \| bd# <CR>
            command! CloseAllBuffers :normal :bufdo bd<CR>
            command! Cwd :echo expand('%')
            "command! CloseAllBuffers :% bd|e#
        "{History search}
            "noremap <Leader><C-h> :browse oldfiles<CR>
            "noremap <Leader><C-h> :History<CR>

    "<Tab>
        "Builtin: gt/gT
        nnoremap <Leader>tc :tabnew<CR>
        nnoremap <Leader>tq :windo bdelete<CR>
        "nnoremap tq :tabclose<CR>
        "nnoremap <C-l> :tabnext<CR>
        "nnoremap <C-h> :tabprev<CR>
        "nnoremap <Leader>0 :tablast<CR>
        "nnoremap <Leader>1 :tabfirst<CR>
        "nnoremap <Leader>2 :tabn 2<CR>
        "nnoremap <Leader>3 :tabn 3<CR>
        "nnoremap <Leader>4 :tabn 4<CR>
        "nnoremap <Leader>5 :tabn 5<CR>

    "<Window>
        noremap <A-c> <C-w>c
        if &runtimepath =~ 'goyo'
            nnoremap mo :Goyo<CR>
        endif
        "noremap m <C-w>
        "noremap H <C-w>h
        "noremap L <C-w>l
        "nnoremap <Tab> <C-w>w
        "noremap <Leader>o <C-w>o
        "noremap <Leader>qw <C-w>c
        "noremap <Leader>Q :qa<CR>

    "<Terminal>
        command! TerminalOpenAtBottom :bot split \| resize 10 \| terminal<CR>i
        "noremap <Leader>ot :bot split \| resize 10 \| terminal<CR>i
        "tnoremap <ESC> <C-\><C-n>
        "tnoremap <C-c><C-c> <C-\><C-n>
        "tnoremap <C-q> <C-c><C-u><C-k>exit 0;<CR>
        "tnoremap <C-q> <C-\><C-n>:bd!<CR>
        "tnoremap <Leader>q <C-w>:q!<CR>

    "<Spelling>
        command! SpellCheck01On  setlocal spell spelllang=en,en_us,cjk
        command! SpellCheck02Off setlocal nospell
        "noremap <LocalLeader>! :setlocal spell spelllang=en,en_us,cjk<CR>
        "noremap <LocalLeader>@ :setlocal nospell<CR>

    "<Clipboard>
        "{Copy current REGISTER to system clipboard}
        vnoremap <Leader>y "+y
        vnoremap <CR> "+y
        "{Copy system clipboard to current register}
        noremap <Leader>p "+p
        "noremap <Leader>" :reg<CR>
        command! CwdCopy let @+ = expand('%') | echo 'Copied: ' @+
        command! PwdCopy let @+ = expand('%:p') | echo 'Copied: ' @+
        "command! CopyFolderRelativePath let @+ = expand('%:h') | echo 'Copied: ' @+
        "command! CopyFolderAbsolutePath let @+ = expand('%:p:h') | echo 'Copied: ' @+

    "<Folding>
        "noremap <space> za
        "noremap <Leader><return> zR
        "noremap <Leader><space> zM
        "{Press space to toggle folding}
        "nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
        "nnoremap <return> za

    "<Highlights> -> Highlight when typing commands
        noremap  n :set hlsearch<cr>n
        noremap  N :set hlsearch<cr>N
        noremap  / :set hlsearch<cr>/
        noremap  ? :set hlsearch<cr>?
        noremap  * #:set hlsearch<cr>
        noremap  # *:set hlsearch<cr>
        vnoremap # "1y/<C-r>1<CR>
        vnoremap * "1y?<C-r>1<CR>

    "[Session]----------------------------------{
        function! AutoSaveSession()
            if isdirectory('.git')
                :mksession! .git/workspace.vim
                :echo 'Saved session to .git/workspace.vim'
            elseif isdirectory('../.git')
                :mksession! ../.git/workspace.vim
                :echo 'Saved session to ../.git/workspace.vim'
            " elseif isdirectory(expand('~/.vim'))
            "     :mksession! ~/.vim/session.vim
            "     :echo 'Saved session to ~/.vim/session.vim'
            else
                :mksession! ~/vim-session.vim
                :echo 'Saved session to ~/vim-session.vim'
            endif
        endfunction

        function! AutoLoadSession()
            if filereadable(expand('workspace.vim'))
                :source workspace.vim
                ":echo 'Load session from workspace.vim'
            elseif filereadable(expand('.git/workspace.vim'))
                :source .git/workspace.vim
                ":echo 'Load session from .git/workspace.vim'
            elseif filereadable(expand('../.git/workspace.vim'))
                :source ../.git/workspace.vim
                ":echo 'Load session from ../.git/workspace.vim'
            elseif filereadable(expand('~/vim-session.vim'))
                :source ~/vim-session.vim
                ":echo 'Load session from ~/vim-session.vim'
            else
                :echo 'No session found.'
            endif
        endfunction
        autocmd FocusLost * if len(getbufinfo({'buflisted':1}))>=3 | call AutoSaveSession() | endif
        "autocmd VimEnter * call AutoLoadSession()

        "{Save session}
        noremap <Leader>S :mksession! ~/vim-session.vim<CR><ESC>
        command! SaveSession :call AutoSaveSession()
        "{Load session}
        noremap <Leader>R :source ~/vim-session.vim<CR><ESC>
        noremap <Leader>R :call AutoLoadSession()<CR>
        command! LoadSession :call AutoLoadSession()
    " }


    "<Builds/Compiles>----{
        " Get current filetype -> :echo &filetype or as variable &filetype
        " [ Builds / Compiles / Interpretes  ]
        "<C/C++ Compiler>  -> Compile & run
            autocmd BufReadPre *.c noremap <buffer> <M-b> :w<CR>:!gcc % -o /tmp/a.out && /tmp/a.out <CR>
            autocmd BufReadPre *.cpp noremap <buffer> <M-b> :w<CR>:!g++ % -o /tmp/a.out && /tmp/a.out <CR>

        "<Python Interpreter>
            autocmd BufReadPre *.py noremap <buffer> <M-b> :w<CR>:!python "%:p" <CR>
            "autocmd BufReadPre *.py noremap <buffer> K yiw:!pydoc <C-r>0<CR>
        "<Bash Script>
            autocmd BufReadPre *.sh noremap <buffer> <M-b> :w<CR>:!bash % <CR>
            autocmd BufReadPre Makefile noremap <buffer> <M-b> :w<CR>:!make <CR>

        "<RCs> (Configs)
            autocmd BufReadPre .vimrc,vimrc* noremap <buffer> <M-b> :w<CR>:source % <CR>
            autocmd BufReadPre .zshrc,zshrc* noremap <buffer> <M-b> :w<CR>:!source % <CR>

        "<Executable>  -> conflict with above
        ""noremap <buffer> <C-u> :!./% <CR>
        ""noremap <buffer> <C-u> :! %:p <CR>

        ">Use FileType group
        "autocmd FileType vim,tmux noremap <buffer> <C-u> :w<CR><ESC>:source % <CR>
        "autocmd FileType zsh noremap <buffer> <C-u> :w<CR>:!source % <CR>
        "autocmd FileType sh noremap <buffer> <C-u> :w<CR>:!bash % <CR>
        "autocmd FileType make noremap <buffer> <C-u> :w<CR>:!make <CR>
        "autocmd FileType python noremap <buffer> <C-u> :w<CR>:!python % <CR>
        "autocmd FileType c noremap <buffer> <C-u> :w<CR>:!gcc % && ./a.out <CR>
        "autocmd FileType cpp noremap <buffer> <C-u> :w<CR>:!g++ % && ./a.out <CR>
    " }

    "<NetRW> -> (Lexplore/Vexplore/Texplore/Explore/Sexplore/edit.)
        "nnoremap <Leader>f :Lexplore<CR>
        "nnoremap <Leader>f :Explore<CR>
        "nnoremap <Leader>f :edit.<CR>

    "<Omni Autocomplete> -> Vim自带的Omni自动补全
        "inoremap <C-d> <C-x><C-l>

    "<Pair-completion>
        "inoremap ' ''<Esc>i
        "inoremap " ""<Esc>i
        "inoremap ( ()<Esc>i
        "inoremap [ []<Esc>i
        "inoremap { {}<Esc>i

    "<Plugins>------------------------------------{
        "[Plugin Manager]
            "noremap <localleader>i :PlugInstall<CR>

        "[tig-explorer]
            if &runtimepath =~ 'tig-explorer'
                "nnoremap <localleader>g :Tig<CR>
                "nnoremap <localleader>G :TigOpenCurrentFile<CR>
            endif
        "[vimagit]
            if &runtimepath =~ 'tig-explorer'
                "let g:magit_show_magit_mapping='<Leader>G'
                "let g:magit_show_magit_mapping='<Leader>g'
            endif

        "[tagbar]
            if &runtimepath =~ 'tagbar' " hit * ->open all folds; = ->close all folds
                "noremap <Leader>t :TagbarToggle<CR>=<ESC>
                noremap T :TagbarToggle<CR>
            endif
            if &runtimepath =~ 'vista' " hit * ->open all folds; = ->close all folds
                "noremap <Leader>t :TagbarToggle<CR>=<ESC>
                noremap tt :Vista!!<CR>
            endif


        "[nnn]
            "nnoremap <LocalLeader>F :NnnPicker<CR>
        "[ranger]
            if &runtimepath =~ 'ranger'
                let g:ranger_map_keys = 0
                "nnoremap <Leader>F :Ranger<CR>
            endif

        "[vim-zoom]
            "nmap mm <Plug>(zoom-toggle)

        "[Syntastic] (Static Code Check)
            if &runtimepath =~ 'syntastic'
                nnoremap <C-n> :lnext<CR>
                nnoremap <C-p> :lprevious<CR>
                nnoremap <LocalLeader>s :SyntasticCheck<CR>
            endif

        "[Undotree]
            "nnoremap <LocalLeader>d :UndotreeToggle<CR>:UndotreeFocus<CR>

        "[Auto-pair]
            "imap <C-d> <Meta>
            "imap <C-d>e <M-e>

        "[fzf]
            if &runtimepath =~ 'fzf'
                "nnoremap <localleader>f :Files %:p:h<CR>
                nnoremap <M-f> :Files<CR>
                nnoremap <LocalLeader>f :Files<CR>
                nnoremap <localleader>H :Helptags<CR>
                nnoremap <localleader>h :History<CR>
                nnoremap <localleader>c :History:<CR>
                nnoremap <localleader>/ :History/<CR>
                nnoremap <localleader>b :Buffers<CR>
                nnoremap <localleader>p :Snippets<CR>
                nnoremap <localleader>C :BCommits<CR>
                nnoremap <localleader>tb :BTags<CR>
                nnoremap <localleader>ta :Tags<CR>
                nnoremap <LocalLeader>a :Ag<CR>
                nnoremap <localleader>m :Marks<CR>
                "nnoremap <localleader>p/ :Files ..
                "nnoremap <localleader>color/ :Colors
                "nnoremap <localleader>k/ :Maps<CR>
            endif
        "[Command-T File Searching]
            "nnoremap <localleader>/ :CommandT<CR>
            "nnoremap <localleader>c :CommandT<CR>

        "[Nerdtree]
            if &runtimepath =~ 'nerdtree'
                "nnoremap <Leader>f :NERDTreeFocus<CR>
                "nnoremap <Leader>f :NERDTreeToggle<CR>
                " Add '%' for changing root accordingly
                "nnoremap <Leader>f :NERDTree %:p:h<CR>
                nnoremap tf :NERDTreeToggle<CR>
                nnoremap tF :NERDTree %:p:h<CR>
                nnoremap <Leader>f :NERDTreeToggle<CR>
                nnoremap <Leader>F :NERDTree %:p:h<CR>
            endif
        "[Nerdtree Tabs]
            if &runtimepath =~ 'nerdtree-tabs'
                " Shift Tabs
                "nnoremap <C-h> gt
                "nnoremap <C-l> gT
                " New Tab
                "nnoremap <Leader>t :tabe<CR>
                " Close Tab
                "nnoremap <Leader>c :tabc
            endif
        "[NerdCommenter]
            if &runtimepath =~ 'nerdcommenter'
                "map <Leader>/ :normal ,cc<CR>
                "nnoremap ` :normal ,cc<CR>
                "nnoremap ~ :normal ,ci<CR>
                "map <Leader>/ :normal ,cu<CR>
                "map <Leader>/ :normal ,ci<CR>
            endif
    " }
" }

