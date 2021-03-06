"-----------------------------------------------------------------
"           __     ___             _  __                         -
"           \ \   / (_)_ __ ___   | |/ /___ _   _ ___            -
"            \ \ / /| | '_ ` _ \  | ' // _ \ | | / __|           -
"             \ V / | | | | | | | | . \  __/ |_| \__ \           -
"              \_/  |_|_| |_| |_| |_|\_\___|\__, |___/           -
"                                           |___/                -
"----------------------------GENERATED-BY-FIGLET------------------

" Get Full path of ~, e.g., /home/ubuntu
let $HOME = expand('~')
let $DOTFILES = expand('~') . '/dotfiles'

" [   Key Mappings / Bindings   ]----------------------------{
    "<Leader key>
        let mapleader = ","
        " let maplocalleader = "\\"

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

    "<Navigation>
        "{Go-next-call}
            "nnoremap m yiw/<C-r>0<CR>
        "{Go-definition}
            nnoremap gd gd
            vnoremap <Leader>gd y/<C-r>0<CR>

        "{Search & Highlight}
            "nnoremap * #
            "nnoremap # *
            " vnoremap # "1y/<C-r>1<CR>
            " vnoremap * "1y?<C-r>1<CR>
            vnoremap g* "1y:%s/<C-r>1//n<CR>
            " Refer: https://vim.fandom.com/wiki/Count_number_of_matches_of_a_pattern
            nnoremap g* #<C-O>:%s///gn<CR>

        "{Move between Windows}
            nnoremap <Left> <C-w>h
            nnoremap <Right> <C-w>l
            nnoremap <Up> <C-w>k
            nnoremap <Down> <C-w>j
            nnoremap <M-h> <C-w>h
            nnoremap <M-l> <C-w>l
            nnoremap <M-j> <C-w>j
            nnoremap <M-k> <C-w>k
            nnoremap <Leader>, <C-w>w

        "{Move between Tabs}
            " nnoremap ( :tabnext<CR>
            " nnoremap ) :tabprev<CR>
            "nnoremap g9 :tabfirst<CR>
            "nnoremap g0 :tablast<CR>

        "{Move between Buffers}
            "nnoremap <Space> :bnext<CR>
            nnoremap - :bprev<CR>:echo expand('%')<CR>
            nnoremap = :bnext<CR>:echo expand('%')<CR>
            " nnoremap { :bprev<CR>:echo expand('%')<CR>
            " nnoremap } :bnext<CR>:echo expand('%')<CR>
            nnoremap t1 :call JumpToBuffer(0)<CR>
            nnoremap t2 :call JumpToBuffer(1)<CR>
            nnoremap t3 :call JumpToBuffer(2)<CR>
            nnoremap t4 :call JumpToBuffer(3)<CR>
            nnoremap t5 :call JumpToBuffer(4)<CR>
            nnoremap t6 :call JumpToBuffer(5)<CR>
            nnoremap t7 :call JumpToBuffer(6)<CR>
            nnoremap t8 :call JumpToBuffer(7)<CR>
            nnoremap t9 :call JumpToBuffer(8)<CR>
            nnoremap t0 :call JumpToBuffer(-1)<CR>
            "Airline Buffers
            if &runtimepath =~ 'vim-airline'
                nmap <Leader>1 <Plug>AirlineSelectTab1
                nmap <Leader>2 <Plug>AirlineSelectTab2
                nmap <Leader>3 <Plug>AirlineSelectTab3
                nmap <Leader>4 <Plug>AirlineSelectTab4
                nmap <Leader>5 <Plug>AirlineSelectTab5
                nmap <Leader>6 <Plug>AirlineSelectTab6
                nmap <Leader>7 <Plug>AirlineSelectTab7
                nmap <Leader>8 <Plug>AirlineSelectTab8
                nmap <Leader>9 <Plug>AirlineSelectTab9
                nmap <Leader>10 <Plug>AirlineSelectTab10
            endif

        "{Move between brackets (JSON)}
            nnoremap ]b :call searchpair('\[','','\]')<cr>
            nnoremap [b :call searchpair('\[','','\]','b')<cr>
            nnoremap ]B :call searchpair('{','','}')<cr>
            nnoremap [B :call searchpair('{','','}','b')<cr>


        "{Move between Tags}
            " nnoremap <Leader><C-]> <C-]>
            if &runtimepath =~ 'ped' && executable('ped')
                vnoremap <Leader>gd "1y:Ped<Space><C-r>1
            endif
            " Pops selection list for ambiguous tags
            " nnoremap <C-]> g<C-]>
            " nnoremap <C-[> <C-i>
            " nnoremap <Leader>tt g]

        "{Move between Marks}
            nnoremap \ `
            if &runtimepath =~ 'vim-markbar'
                nmap fm <Plug>OpenMarkbar
            endif

        "{Move between methods}
            " nnoremap <C-[> [m
            " nnoremap <C-]> ]m

        " Number Line
        nnoremap <leader>l :call ToggleRelativeNumber()<CR>

        "{Jump the file under the cursor}
            " Actually directly using built-in 'gf' will do the trick
            " nnoremap gf :call OpenFileInPrevWindow()<CR>
            "./vim/vimrc-keymappings.vim
            "~/.vim/autoload/plug.vim

        " Grep words under v selection and open files
        vnoremap <Leader>f "1y:call GrepOpen("<C-r>1")<CR>

    "<Edit> -> <Tab> default set to <C-i>, but remap not working
        noremap  <C-c> <Esc>:nohl<CR><ESC>
        nnoremap <ESC> <Esc>:nohl<CR><ESC>
        inoremap ,. <Esc>:nohl<CR><ESC>
        vnoremap ,. <Esc>:nohl<CR><ESC>
        nnoremap ,. <Esc>:nohl<CR><ESC>
        nnoremap <Space> viw
        nnoremap v<Space> viW
        "{Macro}
        " nnoremap 2 q

        "{Yank/Paste}
        "Copy to a dedicated register
        " vnoremap Y "Yy
        "Paste from the dedicated register
        " nnoremap P "Yp

        "inoremap jj <esc>
        "map q <NOP>
        "noremap <Leader>,r q
        nnoremap <Leader>aa :ggVG<CR>
        nnoremap <Leader>ay :%y+<CR>
        nnoremap <Leader>ad :%d+<CR>

        "{Replace-all}
        "noremap  <Leader>ra "1y:% s/<C-r>1/<C-r>1/gc<Left><Left><Left>

        vnoremap r "1y:% s/<C-r>1/<C-r>1/gc<Left><Left><Left>*<BS>
        vnoremap f "1y :Rg <C-r>1<CR>
        nnoremap fw /<C-r>+<CR>
        "{ctrl-v paste reg:0}
        inoremap <C-v> <C-r>0
        "{Select from cursor to the end}
        nnoremap <Leader>v v$h
        nnoremap <Leader>0 v^
        nnoremap Y yiw
        "nnoremap g- ''

        "{Capitalize}
        vnoremap U U
        "{Lowercase}
        vnoremap u u
        "{Switch case}
        vnoremap ~ ~

        "{Register}
        "noremap <Space> "
        "noremap <Leader><Space> :registers<CR>

        "{Git Mergetool}
        if &diff
            map <leader>1 :diffget LOCAL<CR>
            map <leader>2 :diffget BASE<CR>
            map <leader>3 :diffget REMOTE<CR>
        endif

    "<Split>
        "noremap S :vsplit<CR><C-w>l<ESC>:bn<CR><ESC>
        noremap <Leader>s :vsplit<CR><C-w>l
        "{vimrc-edit}
        "nnoremap <Leader>ve :tabnew<CR>:source ~/dotfiles/vim/workspace.vim<CR>:tabnext<CR>
        "nnoremap <Leader>ve :call LoadVimrc()<CR>
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
        "noremap <Leader>ot :bot split \| resize 10 \| terminal<CR>i
        "tnoremap <ESC> <C-\><C-n>
        "tnoremap <C-c><C-c> <C-\><C-n>
        "tnoremap <C-q> <C-c><C-u><C-k>exit 0;<CR>
        "tnoremap <C-q> <C-\><C-n>:bd!<CR>
        "tnoremap <Leader>q <C-w>:q!<CR>

    "<Spelling>
        "noremap <LocalLeader>! :setlocal spell spelllang=en,en_us,cjk<CR>
        "noremap <LocalLeader>@ :setlocal nospell<CR>

    "<Clipboard>
        "{Copy current REGISTER to system clipboard}
        vnoremap <Leader>y "+y
        " vnoremap <A-c> "+y
        vnoremap <CR> "+y
        "{Copy system clipboard to current register}
        noremap <Leader>p "+p
        "noremap <Leader>" :reg<CR>

        nnoremap \\ :echo expand('%')<CR>
        nnoremap tf :Cwd<CR>
        nnoremap tc :CwdCopy<CR>
        nnoremap tp :PwdCopy<CR>
        nnoremap tn :FilenameCopy<CR>

    "<Folding>
        "noremap <space> za
        "noremap <Leader><return> zR
        "noremap <Leader><space> zM
        "{Press space to toggle folding}
        "nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
        "nnoremap <return> za

    "<Highlights> -> Highlight when typing commands
        nnoremap  n :set hlsearch<cr>n
        nnoremap  N :set hlsearch<cr>N
        nnoremap  / :set hlsearch<cr>/
        nnoremap  ? :set hlsearch<cr>?
        "Reverse the matching direction
        nnoremap  * #:set hlsearch<cr>
        nnoremap  # *:set hlsearch<cr>
        "Search words from the clipboard
        nnoremap  !! /<C-r>+<CR>

    "[Session]----------------------------------{
    if v:version >= 800
        "{Save session}
        nnoremap <Leader>S :call SaveSession()<CR><ESC>
        "{Load session}
        " noremap <Leader>R :source ~/vim-session.vim<CR><ESC>
        nnoremap <Leader>R :call LoadSession()<CR><ESC>
        "autocmd VimEnter * call LoadSession()
        autocmd VimLeave,QuitPre,FocusLost * if len(getbufinfo({'buflisted':1}))>=2 | call SaveSession() | endif
    endif
    " }


    "<Builds/Compiles>----{
        " Get current filetype -> :echo &filetype or as variable &filetype
        " [ Builds / Compiles / Interpretes  ]
        "<C/C++ Compiler>  -> Compile & run
            autocmd BufReadPre *.c noremap <buffer> <M-b> :w<CR>:!gcc % -o /tmp/a.out && /tmp/a.out <CR>
            autocmd BufReadPre *.cpp,*.cc noremap <buffer> <M-b> :w<CR>:!g++ % -o /tmp/a.out && /tmp/a.out <CR>

        "<Python Interpreter>
            autocmd BufReadPre *.py noremap <buffer> <M-b> :w<CR>:!python "%:p" <CR>
            "autocmd BufReadPre *.py noremap <buffer> K yiw:!pydoc <C-r>0<CR>
        "<Bash Script>
            autocmd BufReadPre *.sh noremap <buffer> <M-b> :w<CR>:!bash % <CR>
            autocmd BufReadPre Makefile noremap <buffer> <M-b> :w<CR>:!make <CR>

        "<RCs> (Configs)
            autocmd BufReadPre .vim,.vimrc,vimrc* noremap <buffer> <M-b> :w<CR>:source % <CR>
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

    "<Language Specific>-----{
        " <Python>
            " (Could use [m and ]m instead)
            " autocmd FileType python nnoremap <buffer> [[ ?^class\\|^\s*def<CR>
            " autocmd FileType python nnoremap <buffer> ]] /^class\\|^\s*def<CR>
    "}

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
            if &runtimepath =~ 'tig-explorer' && executable('tig')
                "nnoremap <localleader>g :Tig<CR>
                "nnoremap <localleader>G :TigOpenCurrentFile<CR>
            endif
        "[vimagit]
            if &runtimepath =~ 'tig-explorer' && executable('tig')
                "let g:magit_show_magit_mapping='<Leader>G'
                "let g:magit_show_magit_mapping='<Leader>g'
            endif
        "[vim-gitgutter]
            if &runtimepath =~ 'gitgutter' && executable('git')
                " nnoremap ]h :GitGutterNextHunk<CR>
                " nnoremap [h :GitGutterPrevHunk<CR>
                " Changed Hunks
                " nnoremap gn :GitGutterNextHunk<CR>
                " nnoremap gp :GitGutterPrevHunk<CR>
                " nnoremap gP :GitGutterPreviewHunk<CR>
                nnoremap [p :GitGutterPreviewHunk<CR>
                " Toggle/fold changed lines
                nnoremap gz :GitGutterFold<CR>
                " Diff
                command! ChangeGitDiffBase let g:gitgutter_diff_base = 'master'
            endif

        "[tagbar]
            if &runtimepath =~ 'tagbar' " hit * ->open all folds; = ->close all folds
                "noremap <Leader>t :TagbarToggle<CR>=<ESC>
                noremap T :TagbarToggle<CR>
            endif
            if &runtimepath =~ 'vista' " hit * ->open all folds; = ->close all folds
                "noremap <Leader>t :TagbarToggle<CR>=<ESC>
                " noremap tt :Vista!!<CR>
                noremap tt :Vista show<CR>
            endif

        "[AnyJump]
        if &runtimepath =~ 'any-jump'
            ">>>Find usages
            nnoremap fu :AnyJump<CR>
        endif
        nnoremap K :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>

        if &runtimepath =~ 'telescope'
            nnoremap <leader>gf <cmd>lua require('telescope.builtin').find_files()<cr>
            nnoremap <leader>gg <cmd>lua require('telescope.builtin').live_grep()<cr>
            nnoremap <leader>gb <cmd>lua require('telescope.builtin').buffers()<cr>
            nnoremap <leader>gt <cmd>lua require('telescope.builtin').help_tags()<cr>
        endif

        "[Jedi-vim]
        if &runtimepath =~ 'jedi-vim'
            " nnoremap <Leader>d :call jedi#goto_definitions()<CR>
            nnoremap <Leader>d :call jedi#goto()<CR>
            nnoremap <Leader>n :call jedi#usages()<CR>
        endif

        "[nnn]
            "nnoremap <LocalLeader>F :NnnPicker<CR>
        "[ranger]
            if &runtimepath =~ 'ranger' && executable('ranger')
                let g:ranger_map_keys = 0
                "nnoremap <Leader>F :Ranger<CR>
            endif

        "[vim-zoom]
            "nmap mm <Plug>(zoom-toggle)

        "[Linter] (Static Code Check)
            if &runtimepath =~ 'syntastic'
                " nnoremap <C-n> :lnext<CR>
                " nnoremap <C-p> :lprevious<CR>
                " Go Error Next
                nnoremap gen :lnext<CR>
                " Go Error Previous
                nnoremap gep :lprevious<CR>
                " nnoremap <LocalLeader>s :SyntasticCheck<CR>
            endif
            if &runtimepath =~ 'ale'
                " Go Error Next
                nnoremap <C-n> :ALENext<CR>
                " Go Error Previous
                nnoremap <C-p> :ALEPrevious<CR>
                " nnoremap <LocalLeader>s :SyntasticCheck<CR>
            endif

        "[Undotree]
            "nnoremap <LocalLeader>d :UndotreeToggle<CR>:UndotreeFocus<CR>

        "[Auto-pair]
            "imap <C-d> <Meta>
            "imap <C-d>e <M-e>

        "[fzf] Fuzzy General Searching
        if &runtimepath =~ 'fzf'
            "nnoremap <localleader>f :Files %:p:h<CR>
            nnoremap <M-f> :Files<CR>
            " nnoremap <LocalLeader>f :Files<CR>
            " nnoremap <localleader>H :Helptags<CR>
            " nnoremap <localleader>h :History<CR>
            " nnoremap <localleader>c :History:<CR>
            " nnoremap <localleader>/ :History/<CR>
            " nnoremap <localleader>p :Snippets<CR>
            " nnoremap <localleader>C :BCommits<CR>
            " nnoremap <localleader>b :Buffers<CR>
            " nnoremap <localleader>t :Tags<CR>
            " nnoremap <LocalLeader>a :Ag<CR>
            " nnoremap <localleader>m :Marks<CR>
            "nnoremap <localleader>p/ :Files ..
            "nnoremap <localleader>color/ :Colors
            "nnoremap <localleader>k/ :Maps<CR>
            nnoremap fd :Files<CR>
            nnoremap fg :GFiles<CR>
            nnoremap fb :call fzf#vim#buffers(fzf#vim#with_preview('right:0%'))<CR>
            nnoremap ft :Tags<CR>
            nnoremap fc :History:<CR>
            nnoremap fC :Commands<CR>
            nnoremap fh :History<CR>
            nnoremap fa :Rg<CR>
            nnoremap fm :Marks<CR>
            " nnoremap fa :call fzf#vim#ag('', fzf#vim#with_preview('right'))<CR>
            nnoremap fs :Snippets<CR>
            " nnoremap fS :History/<CR>
            " nnoremap fm :Marks<CR>
        endif
        "[Command-T] Fuzzy Searching
            "nnoremap <localleader>/ :CommandT<CR>
            "nnoremap <localleader>c :CommandT<CR>

        "[Fzy] Fuzzy Searching
        "...

        "[Nerdtree]
            if &runtimepath =~ 'nerdtree'
                nnoremap <Leader>f :NERDTree<CR>
                " nnoremap <Leader>F :NERDTree %:p:h<CR>
                nnoremap <Leader>F :NERDTreeFind<CR>zz
                " Add '%' for changing root accordingly
                "nnoremap <Leader>f :NERDTree %:p:h<CR>
                nnoremap FF :NERDTree<CR>
                nnoremap ff :NERDTreeFind<CR>zz
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

        "[Vim-Clap]
        if &runtimepath =~ 'clap'
            nnoremap fgg :Clap grep<CR>
            nnoremap fgf :Clap gfiles<CR>
            nnoremap fgh :Clap history<CR>
            nnoremap fgb :Clap buffers<CR>
        endif
    " }
" }

