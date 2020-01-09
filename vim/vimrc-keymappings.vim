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
        "{Search & Highlight}
            "nnoremap * #
            "nnoremap # *
            " vnoremap # "1y/<C-r>1<CR>
            " vnoremap * "1y?<C-r>1<CR>
            vnoremap g* "1y:%s/<C-r>1//n<CR>
            " Refer: https://vim.fandom.com/wiki/Count_number_of_matches_of_a_pattern
            nnoremap g* #<C-O>:%s///gn<CR>
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
            nnoremap <C-]> g<C-]>
            " nnoremap <C-[> <C-i>
            nnoremap <Leader>tt g]
        "{Jump the file under the cursor}
            function! OpenFileInPrevWindow()
                "Refer: https://unix.stackexchange.com/questions/74571
                let cfile = expand("<cfile>")
                if filereadable(cfile)
                    wincmd p
                    execute "edit " . cfile
                endif
            endfunction

            nnoremap <C-y> :call OpenFileInPrevWindow()<CR>
            "./vim/vimrc-keymappings.vim
            "~/.vim/autoload/plug.vim

    function! EscapeText(text)
        let l:escaped_text = a:text

        " Map characters to named C backslash escapes. Normally, single-quoted
        " strings don't require double-backslashing, but these are necessary
        " to make the substitute() call below work properly.
        let l:charmap = {
        \   '"'     : '\\"',
        \   "'"     : '\\''',
        \   "\n"    : '\\n',
        \   "\r"    : '\\r',
        \   "\b"    : '\\b',
        \   "\t"    : '\\t',
        \   "\x07"  : '\\a',
        \   "\x0B"  : '\\v',
        \   "\f"    : '\\f',
        \   }

        " Escape any existing backslashes in the text first, before
        " generating new ones. (Vim dictionaries iterate in arbitrary order,
        " so this step can't be combined with the items() loop below.)
        let l:escaped_text = substitute(l:escaped_text, "\\", '\\\', 'g')

        " Replace actual returns, newlines, tabs, etc., with their escaped
        " representations.
        for [original, escaped] in items(charmap)
            let l:escaped_text = substitute(l:escaped_text, original, escaped, 'g')
        endfor

        " Replace any other character that isn't a letter, number,
        " punctuation, or space with a 3-digit octal escape sequence. (Octal
        " is used instead of hex, since octal escapes terminate after 3
        " digits. C allows hex escapes of any length, so it's possible for
        " them to run up against subsequent characters that might be valid
        " hex digits.)
        let l:escaped_text = substitute(l:escaped_text,
        \   '\([^[:alnum:][:punct:] ]\)',
        \   '\="\\o" . printf("%03o",char2nr(submatch(1)))',
        \   'g')

        return l:escaped_text

    endfunction

    function! PasteEscapedRegister(where)
        " Remember current register name, contents, and type,
        " so they can be restored once we're done.
        let l:save_reg_name     = v:register
        let l:save_reg_contents = getreg(l:save_reg_name, 1)
        let l:save_reg_type     = getregtype(l:save_reg_name)
        echo "register: [" . l:save_reg_name . "] type: [" . l:save_reg_type . "]"
        " Replace the contents of the register with the escaped text, and set the
        " type to characterwise (so pasting into an existing double-quoted string,
        " for example, will work as expected).
        call setreg(l:save_reg_name, EscapeText(getreg(l:save_reg_name)), "c")
        " Build the appropriate normal-mode paste command.
        let l:cmd = 'normal "' . l:save_reg_name . (a:where == "before" ? "P" : "p")
        " Insert the escaped register contents.
        exec l:cmd

        " Restore the register to its original value and type.
        call setreg(l:save_reg_name, l:save_reg_contents, l:save_reg_type)

    endfunction

    "<Edit> -> <Tab> default set to <C-i>, but remap not working
        noremap  <C-c> <Esc>:nohl<CR><ESC>
        nnoremap <ESC> <Esc>:nohl<CR><ESC>
        inoremap ,. <Esc>:nohl<CR><ESC>
        vnoremap ,. <Esc>:nohl<CR><ESC>
        noremap ,. <Esc>:nohl<CR><ESC>
        nnoremap <Space> viw
        nnoremap <LEADER><Space> viW
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
        noremap <Leader>s :vsplit<CR><C-w>l
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
        " vnoremap <A-c> "+y
        vnoremap <CR> "+y
        "{Copy system clipboard to current register}
        noremap <Leader>p "+p
        "noremap <Leader>" :reg<CR>
        command! Cwd :echo expand('%')
        command! CwdCopy let @+ = expand('%') | echo 'Copied: ' @+
        command! PwdCopy let @+ = expand('%:p') | echo 'Copied: ' @+
        command! FilenameCopy let @+ = expand('%:t') | echo 'Copied: ' @+
        command! RemoteGitFileReference call GetGitRemoteCodeReferenceLink()
        "command! CopyFolderRelativePath let @+ = expand('%:h') | echo 'Copied: ' @+
        "command! CopyFolderAbsolutePath let @+ = expand('%:p:h') | echo 'Copied: ' @+

        nnoremap tf :Cwd<CR>
        nnoremap tc :CwdCopy<CR>
        nnoremap tp :PwdCopy<CR>
        nnoremap td :FilenameCopy<CR>

        function! GetGitRemoteCodeReferenceLink()
            "Expected URL
                "https://git.appannie.org/appannie/aa-bulk-grabber/blob/master/webanalytics/tasks/bulk_grabber/dimension_info_merger.py#L13"
            "Formatted string
                "https://${REPO}/blob/${BRANCH}/${FILEPATH}#{LINE-NUMBER}"
            let repo = trim(system("git remote get-url origin | sed 's/^git@//; s/\.git$//'"))
            let branch = trim(system("git rev-parse --abbrev-ref HEAD"))
            let cwd = expand('%')
            let lineno = line(".")
            let url = "https://".repo."/blob/".branch."/".cwd."#L".lineno
            let @+ = url
            echo 'Copied: ' url
        endfunction

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

        "{Save session}
        noremap S :call AutoSaveSession()<CR><ESC>
        command! SessionSave :call AutoSaveSession()
        "{Load session}
        " noremap <Leader>R :source ~/vim-session.vim<CR><ESC>
        noremap R :call AutoLoadSession()<CR><ESC>
        command! SessionLoad :call AutoLoadSession()
        "autocmd VimEnter * call AutoLoadSession()
        autocmd VimLeave,QuitPre,FocusLost * if len(getbufinfo({'buflisted':1}))>=2 | call AutoSaveSession() | endif
        " if v:version > 800
        " endif
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
                nnoremap <localleader>p :Snippets<CR>
                nnoremap <localleader>C :BCommits<CR>
                nnoremap <localleader>b :Buffers<CR>
                nnoremap <localleader>t :Tags<CR>
                nnoremap <LocalLeader>a :Ag<CR>
                nnoremap <localleader>m :Marks<CR>
                "nnoremap <localleader>p/ :Files ..
                "nnoremap <localleader>color/ :Colors
                "nnoremap <localleader>k/ :Maps<CR>
                nnoremap fd :GFiles<CR>
                nnoremap fb :Buffers<CR>
                nnoremap ft :Tags<CR>
                nnoremap fc :History:<CR>
                nnoremap fh :History<CR>
                " nnoremap fa :Ag<CR>
                nnoremap fa :call fzf#vim#ag('', fzf#vim#with_preview('right'))<CR>
                nnoremap fs :Snippets<CR>
                " nnoremap fS :History/<CR>
                " nnoremap fm :Marks<CR>
            endif
        "[Command-T File Searching]
            "nnoremap <localleader>/ :CommandT<CR>
            "nnoremap <localleader>c :CommandT<CR>

        "[Nerdtree]
            if &runtimepath =~ 'nerdtree'
                nnoremap <Leader>f :NERDTree<CR>
                nnoremap <Leader>F :NERDTree %:p:h<CR>
                " Add '%' for changing root accordingly
                "nnoremap <Leader>f :NERDTree %:p:h<CR>
                nnoremap FF :NERDTree<CR>
                nnoremap ff :NERDTree %:p:h<CR>
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
            nnoremap <C-j>g :Clap grep<CR>
            nnoremap <C-j>f :Clap gfiles<CR>
            nnoremap <C-j>h :Clap history<CR>
            nnoremap <C-j>b :Clap buffers<CR>
        endif
    " }
" }

