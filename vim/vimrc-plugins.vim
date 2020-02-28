"-----------------------------------------------------------------
"        __     ___             ____  _             _            -
"        \ \   / (_)_ __ ___   |  _ \| |_   _  __ _(_)_ __       -
"         \ \ / /| | '_ ` _ \  | |_) | | | | |/ _` | | '_ \      -
"          \ V / | | | | | | | |  __/| | |_| | (_| | | | | |     -
"           \_/  |_|_| |_| |_| |_|   |_|\__,_|\__, |_|_| |_|     -
"                                             |___/              -
"----------------------------GENERATED-BY-FIGLET------------------
"
" Dependencies:
"     " [Plugins Manager: Vim-Plug]
"           $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"     " [Plug  dependencies]
"           $ brew install ctags
"           or
"           $ brew install --HEAD universal-ctags/universal-ctags/universal-ctags
"
" Commands:
"     - Install plugins: ":PlugInstall"
"     - Check current filetype: ":echo &filetype"
"     - Build current file: "Ctrl-u"
"
" Performance:
"   vim --startuptime /tmp/vim-time.log +qall && cat /tmp/vim-time.log |sort -nrk 2
"   "or
"   :Startuptime

" Get Full path of ~, e.g., /home/ubuntu
let $HOME = expand('~')
let $DOTFILES = expand('~') . '/dotfiles'

" [  Plugins Manager vim-plug  ]
call plug#begin('~/.vim/plugged')
    " [    UI / Appearence     ]

        "<Start>
            Plug 'mhinz/vim-startify'

        "<Theme>
            " Plug 'morhetz/gruvbox'
            " Plug 'Rigellute/shades-of-purple.vim'

        "<STATUS-BAR>
            Plug 'vim-airline/vim-airline'
            Plug 'vim-airline/vim-airline-themes'

        "<Syntax Highlighting>
            if has('nvim') && ((has('python') || has('python3')))
                "The Best for python-syntax (pynvim required)
                Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
            endif
            "Plug 'hdima/python-syntax'  "Stable. (missing color for arguments)
            " Plug 'sheerun/vim-polyglot'  "Ordinary, full support for most language
            " Plug 'junegunn/rainbow_parentheses.vim'
            " Plug 'jiangmiao/auto-pairs' "Smartest (bug:)


        "<Window>
            "Plug 'TaDaa/vimade'  "Dim inactive windows
            "Plug 'vim-scripts/ZoomWin' "Zoom In/Out (Error)
            Plug 'dhruvasagar/vim-zoom'
            Plug 'junegunn/goyo.vim'  "Focus Mode
            if has('nvim')
                Plug 'rbgrouleff/bclose.vim'
            endif

        "<Terminal>
            "Plug 'kassio/neoterm'

    " [    NAVIGATION   ]

        "<Fuzzy File Search>
            " <fzf>
            Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            Plug 'junegunn/fzf.vim'

            "vim-Clap (Pop window search)
            " if has('nvim-0.4') || has('patch-8.1.2114')
            "     Plug 'liuchengxu/vim-clap'  "Slow & stupid
            " endif

            "<NetRW>
            Plug 'tpope/vim-vinegar'      "Netrw enhancement

        "<NERDTREE>
            Plug 'scrooloose/nerdtree'          " File tree manager
            Plug 'jistr/vim-nerdtree-tabs'      " enhance nerdtree's tabs
            Plug 'ryanoasis/vim-devicons'       " add beautiful icons besides files

        "<Bookmarks>
            "Plug 'MattesGroeger/vim-bookmarks'  "Manage bookmarks

        "<nnn>
            " Plug 'mcchrish/nnn.vim'

        "<Ranger>
            " Plug 'francoiscabrol/ranger.vim'

        "<History>
            Plug 'yegappan/mru'

        "<Tags> (ctags required)
            if executable('ctags')
                Plug 'majutsushi/tagbar'   "Display
                Plug 'ludovicchabant/vim-gutentags' "Manage tags (auto)
                "Plug 'craigemery/vim-autotag'  "Navigate (manually gen tags)
            else
                echomsg 'Missing dependency: brew install ctags'
            endif
            if executable('ctags')
                Plug 'liuchengxu/vista.vim'  "More friendly tagbar
            else
                echomsg 'Missing dependency: brew install ctags'
            endif
            if &filetype == 'python'
                if executable('ped')
                    Plug 'sloria/vim-ped'  "(Python) Jump to 3rd party modules
                else
                    echomsg 'Missing dependency: pip isntall ped --user'
                endif
            endif

        "<Git>
            if executable('git')
                "Plug 'jreybert/vimagit'  "Much easier with Git
                "Plug 'tpope/vim-fugitive' "Work with fzf for :Commits
                Plug 'airblade/vim-gitgutter'  "Shwo diff inline
                " if has('nvim') || has('patch-8.0.902')
                "     Plug 'mhinz/vim-signify'
                " else
                "     Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
                " endif
            " else
            "     echomsg 'Plugin [vimagit, vim-fugitive] not loaded because git not exists'
                if executable('tig')
                    Plug 'iberianpig/tig-explorer.vim' "faster/prettier (tig required)
                else
                    echomsg 'Plugin [tig-explorer] not loaded because commands not exists'
                endif
            endif

        "<Search>
            Plug 'bronson/vim-visual-star-search'

        "<Documentation>
            "Plug 'powerman/vim-plugin-viewdoc' "K-preview improvement

    " [   EDIT    ]

        "<Autocomplete>
            "[Snippets]
                if has('python3')
                    Plug 'SirVer/ultisnips'  " Track the engine.
                    Plug 'honza/vim-snippets'  " Snippets are separated from the engine.
                else
                    echomsg 'Missing dependency: brew install python3'
                endif
            "[Deoplete]
                if has('python3')
                    Plug 'Shougo/deoplete.nvim'
                    Plug 'zchee/deoplete-jedi'    " Python completion source
                    Plug 'Shougo/deoplete-clangx'   " C/C++ completion source
                    if has('vim') ">> For vim only
                        Plug 'roxma/nvim-yarp' " Nvim Remote Plugin Framework
                        Plug 'roxma/vim-hug-neovim-rpc'  ">> to work with Vim8
                    endif
                    let g:deoplete#enable_at_startup = 1
                    let g:deoplete#num_processes = 1
                else
                    echomsg 'Missing dependency: brew install python3'
                endif
            "[Tabnine]  (Based on YouCompleteMe)
                " Plug 'zxqfl/tabnine-vim'
            "[Auto-pair]  (Bracket Closing)
                Plug 'jiangmiao/auto-pairs' "Smartest (:buggy)

        "<Register>
            " Plug 'junegunn/vim-peekaboo'

        "<Comment>
            Plug 'tomtom/tcomment_vim'

        "<Selection>
            " Plug 'michaeljsmith/vim-indent-object'

        "<Code Check>
            "[Syntastic]
                if has('python') || has('python3')
                    Plug 'vim-syntastic/syntastic' "Static Code Check
                    " Plug 'mgedmin/coverage-highlight.vim'
                endif
            "[ALE]
                " Plug 'dense-analysis/ale'

        "<Indentation>
            " ---> BUGS FOR JSON FORMAT: It hdies/conceals quotes for JSON !!!
            Plug  'Yggdroot/indentLine'    "Beautiful indent lines
            " Plug 'elzr/vim-json'  "Fix for JSON rendering

        "<Trailing Whitespace>
            Plug 'bronson/vim-trailing-whitespace'

        "<Undo>
            Plug 'mbbill/undotree'

    " [   SESSION    ]
        "Plug 'tpope/vim-obsession'  "For Tmux to restore VIM sessions

    " [   PERFORMANCE    ]
        Plug 'tweekmonster/startuptime.vim'   "VIM loading analysis

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==============================LAZY LOADING=================================
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" [  Lazy Load Plugins  ]-----------{
    "<UltiSnips>  -> Very slow
    " augroup load_us
    "     autocmd!
    "     autocmd InsertEnter * call plug#load('ultisnips') | autocmd! load_us
    " augroup END
" }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==============================PLUGIN SETTINGS=================================
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PluginSettings()
    echomsg ""
endfunction


" <Vim Obsession>--------{
    " Auto record session on VIM's exit (No space between multiple files)
        "autocmd VimLeave * :Obsession /tmp/obsession.vim
        "autocmd VimLeave *.py,*.json :Obsession /tmp/obsession.vim
" }


" <Vim-auto-pairs>--------{
" https://github.com/jiangmiao/auto-pairs
    if &runtimepath =~ 'auto-pairs'
        let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
        "Fly mode
        let g:AutoPairsFlyMode = 0
        "Options
        let g:AutoPairsMultilineClose = 0 "Solve bug of deleting pair
        "let g:AutoPairsMapBS = 0
        "let g:AutoPairsMapCh = 0
        let g:AutoPairsMapCR = 0  "Has bug for nested level
        "let g:AutoPairsCenterLine = 0
        "let g:AutoPairsMapSpace = 0
        let g:AutoPairsShortcutToggle = '<M-i>'  " Default to <M-p>
    endif
" }


" <UltiSnips>--------{
    if &runtimepath =~ 'ultisnips'
        " Trigger configuration.
        " Do not use <tab> if you use YouCompleteMe.
        let g:UltiSnipsExpandTrigger="<Tab>"
        let g:UltiSnipsJumpForwardTrigger="<C-n>"
        let g:UltiSnipsJumpBackwardTrigger="<C-p>"
        " If you want :UltiSnipsEdit to split your window.
        let g:UltiSnipsEditSplit="vertical"
        " Specify snippets locations
        " !! MUST BE FULL PATH (~ DOESN'T WORK) !!
        let g:UltiSnipsSnippetsDir = $HOME."~/.vim/mysnippets"
        let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/mysnippets']
        " Could be buggy if not specifying the Python version
        if has('python3')
            let g:UltiSnipsUsePythonVersion=3
        endif
    endif
" }


" <Indentline>--------{
" https://github.com/Yggdroot/indentLine
    if &runtimepath =~ 'indentLine'
        let g:indentLine_enabled = 1
        let g:indentLine_char='│'
        let g:indentLine_conceallevel = 2
        let g:indentLine_color_term = 239
        let g:indentLine_concealcursor = ''
        "let g:indentLine_setColors = 0
        "let g:indentLine_setConceal = 0  "0->Show quotes; 1or2->Hide quotes

        " BUGS FOR JSON FORMAT --> It hdie/conceal quotes for JSON !!!
        " autocmd FileType json set conceallevel = 0  "Manually
        " autocmd FileType json let g:indentLine_enabled=0
        let g:vim_json_syntax_conceal=0
        let g:indentLine_setConceal=0
        " If none is working, make sure there's no other JSON plugins,
        " then edit the `json.vim` --->
        " :e $VIMRUNTIME/syntax/json.vim
        " :g/if has('conceal')/s//& \&\& 0/
        " :wq
    endif
" }


" <PyDiction>-------------{
    "let g:pydiction_location = '$HOME/.vim/plugged/pydiction/complete-dict'
    "let g:pydiction_menu_height = 7
" }


" <Vimade>-------------{
    "let g:vimade.fadelevel=0.3
    "let g:vimade.rowbufsize=30
    "let g:vimade.colbufsize=30
    "let g:vimade.checkinterval=500
" }


" <Goyo - focus mode>-------------{
" https://github.com/junegunn/goyo.vim
    if &runtimepath =~ 'goyo'
        let g:goyo_width = 120
        let g:goyo_height = '85%'
        let g:goyo_linenr = 0
    endif
" }


" <Syntastic>-------------{
" https://github.com/vim-syntastic/syntastic
    if &runtimepath =~ 'syntastic'
        let g:syntastic_enable_signs = 1
        let g:syntastic_error_symbol='✗'
        let g:syntastic_warning_symbol='⚠'
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 0
        let g:syntastic_check_on_open = 1
        let g:syntastic_loc_list_height = 5
        highlight SyntasticErrorSign guifg=white guibg=black
        "let g:syntastic_check_on_wq = 0
        " [CHECKERS]
            " Python (pyflakes is faster than pylint)
            let g:syntastic_python_checkers=['flake8']
            " Clang
            let g:syntastic_cpp_checkers = ['gcc']
            let g:syntastic_cpp_compiler = 'gcc'
    endif
" }


" <ALE>-------------{
" https://github.com/dense-analysis/ale
    if &runtimepath =~ 'ale'
        let g:ale_fix_on_save = 0
        let b:ale_warn_about_trailing_whitespace = 0
        let g:ale_sign_error = 'E'
        let g:ale_sign_warning = 'W'
        " let b:ale_linters = {'python': ['bandit']}
        " let b:ale_fixers = {
        " \   'python': ['autopep8'],
        " \   'c++': ['clang', 'gcc']
        " \}
    endif
" }


" <ViewDoc>-------------{
    let g:viewdoc_open = 'belowright new' "tabnew|belowright new|topleft new
" }


" <Vim markdown preview>-------------{
    let vim_markdown_preview_github=1
" }

" <Deoplete>--------------{
" https://github.com/Shougo/deoplete.nvim
    if &runtimepath =~ 'deoplete'
        " Environment
        "set pyxversion=3  "[error]
        "let g:python3_host_prog = "/usr/local/bin/python3"
        " Close preview window after completion
            autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
        "Delay time
        let g:deoplete#auto_complete_delay = 100
        " Max number of candidates
            let g:deoplete#max_abbr_width = 30
            let g:deoplete#max_menu_width = 40
        " Set multiple options
            "call deoplete#custom#option({
            "\ 'candidate_marks': 10,
            "\ 'auto_complete_delay': 0,
            "\ 'smart_case': v:true,
            "\ })
        " Deoplete-jedi
            "let g:deoplete#sources#jedi#enable_typeinfo = 0
            "let g:deoplete#sources#jedi#show_docstring = 0
        " deoplete-clangx
            " Change clang binary path
            "call deoplete#custom#var('clangx', 'clang_binary', '/usr/local/bin/clang')
            " Change clang options
            "call deoplete#custom#var('clangx', 'default_c_options', '')
            "call deoplete#custom#var('clangx', 'default_cpp_options', '')
    endif
" }


" <nnn>------------{
    if &runtimepath =~ 'nnn'
        "layout
        let g:nnn#layout = { 'left': '~20%' }
        "disable
        let g:nnn#command = 'DISABLE_FILE_OPEN_ON_NAV=1 nnn -l'
    endif
" }


" <SimpylFold>------------{
    "let g:SimpylFold_docstring_preview = 1
" }

" <Rainbow-parentasis>--------------{
    if &runtimepath =~ 'rainbow_parentheses'
        let g:rainbow#max_level = 16
        let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
        " Activation based on file type
        augroup rainbow_lisp
          autocmd!
          autocmd FileType lisp,clojure,scheme,python,json,vim RainbowParentheses
        augroup END
    endif
" }

" <Autotag>--------------{
    "let g:autotagTagsFile="~/.vim/tags"
    " if !isdirectory("~/.vim/tags")
    "    silent! call mkdir(s:vim_tags, 'p')
    " endif
" }

" <Gutentags>--------------{
    if &runtimepath =~ 'gutentags'
        " Searching fields (recursively searching from bottom up)
        let g:gutentags_project_root = ['Makefile', '.git', '.root', '.svn', '.project']
        " Ignore some specifi projects
        " let g:gutentags_exclude_project_root = ['~/workspace/']
        " Tag filename
        let g:gutentags_ctags_tagfile = 'tags'
        " List files method (critical to speed)
        if executable('git') && isdirectory('.git')
            let g:gutentags_file_list_command = 'git ls-files'
        elseif executable('rg')
            let g:gutentags_file_list_command = 'rg --files'
        " elseif executable('ag')
        "     let g:gutentags_file_list_command = 'ag -l'
        else
            let g:gutentags_file_list_command = 'find . -type f'
        endif
        let g:gutentags_exclude_filetypes = ['json', 'csv', 'txt', 'xml', 'html', 'gz', 'xls', 'doc']
        let g:gutentags_ctags_exclude = ['.git']
        " Tag files store place, instead of project dirs
        " let s:vim_tags = expand('~/.vim/tags')
        let s:vim_tags = '.git/ctags'
        let g:gutentags_cache_dir = s:vim_tags
        " Create tag dir if not exists
        if !isdirectory(s:vim_tags)
           silent! call mkdir(s:vim_tags, 'p')
        endif
        " Ctag command flags
        let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
        let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
        let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
        let g:gutentags_ctags_extra_args += ['--python-kinds=-i']
    endif
" }

" <Tagbar>--------------{
    if &runtimepath =~ 'tagbar'
        let g:tagbar_left = 0  "Show tagbar on right
        let g:tagbar_autofocus = 1   "Focus on tagbar window when open
        let g:tagbar_autoclose = 1   "Close tagbar window when select tag
        "let g:tagbar_autoshowtag = 0
        let g:tagbar_sort = 0
        let g:tagbar_expand = 0
        let g:tagbar_vertical = 30
        "let g:tagbar_singleclick = 1
        let g:tagbar_compact = 1
        "let g:tagbar_autopreview = 1
        "let g:tagbar_previewwin_pos = 'rightbelow'
        "let g:tagbar_indent = 1
        "let g:tagbar_show_visibility = 1
    endif
" }

" <Vista-tagbar>--------------{
    if &runtimepath =~ 'vista'
        let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
        let g:vista_default_executive = 'ctags'
        let g:vista_sidebar_width = 40
        " let g:vista_sidebar_position = 'vertical botright'  "botright | topleft
        " let g:vista_sidebar_position = 1  # Any value will make it to the top possition
        " let g:vista_fzf_preview = ['right:30%']
        " let g:vista_default_executive = 1 "Close vista after jump to a link
        let g:vista#renderer#enable_icon = 1
        let g:vista#renderer#icons = {
        \   "function": "\uf794",
        \   "variable": "\uf71b",
        \  }
    endif
" }

" <Python syntax>------------------{
    if &runtimepath =~ 'python-syntax'
        let g:python_highlight_all = 1
    endif
" }

" <Semshi python syntax>------------------{
    hi semshiLocal           ctermfg=209 guifg=#ff875f
    hi semshiGlobal          ctermfg=214 guifg=#ffaf00
    hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
    hi semshiParameter       ctermfg=75  guifg=#5fafff
    hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
    hi semshiFree            ctermfg=218 guifg=#ffafd7
    hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
    hi semshiAttribute       ctermfg=49  guifg=#00ffaf
    hi semshiSelf            ctermfg=249 guifg=#b2b2b2
    hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
    hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
    hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
    hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
    sign define semshiError text=E> texthl=semshiErrorSign

    if &runtimepath =~ 'semshi'
        let g:semshi#active = v:true
        let g:semshi#excluded_hl_groups = ['local']
        let g:semshi#simplify_markup = v:true
        let g:semshi#always_update_all_highlights = v:true
        "Don't show a sign by the line-no if a syntax error occurred
        let g:semshi#error_sign = v:false
        "Tolerate some minor syntax errors to update highlights
        let g:semshi#tolerate_syntax_errors = v:true
        "Set syntax Highlighting for python
        function! MyCustomHighlights()
            hi semshiGlobal      ctermfg=red guifg=#ff0000
        endfunction
        autocmd FileType python call MyCustomHighlights()
        "Add Highlight Groups to persist across colorscheme switches
        autocmd ColorScheme * call MyCustomHighlights()
    endif
" }


" <Jedi settings>---------------------{
    if &runtimepath =~ 'jedi'
        let g:jedi#force_py_version=2.7
    endif
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
    if &runtimepath =~ 'command-t'
        let g:CommandTMaxDepth = 10
        let g:CommandTMaxFiles=2000
        let g:CommandTSuppressMaxFilesWarning = 1
        set wildignore+=".*, *.dat, *.o, *.pyc, */.git, *.pdf, *.app, *.jpg, *.png, *.gif, *.doc, *.docx"
    endif
" }


" <Fzf fuzzy search>-------------------------{
    if &runtimepath =~ 'fzf'
        "let g:fzf_action = {  }
        " This is the default extra key bindings
        let g:fzf_action = {
          \ 'ctrl-t': 'tab split',
          \ 'ctrl-x': 'split',
          \ 'ctrl-v': 'vsplit' ,
          \ 'ctrl-e': 'edit' }
        " Default fzf layout
            " down | up | left | right
            let g:fzf_layout = { 'down': '~40%' }
        " [Buffers] Jump to the existing window if possible
            "let g:fzf_buffers_jump = 1
        " [[B]Commits] Customize the options used by 'git log':
            let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
        " [Tags] Command to generate tags file
            let g:fzf_tags_command = 'ctags -R'
        " [History] -> will block Ctrl-n & Ctrl-p keys
            "let g:fzf_history_dir = '~/.vim/fzf-history'
        " - enew / -tabnew / 10split enew
            "let g:fzf_layout = { 'window': 'enew' }
            "let g:fzf_layout = { 'window': '-tabnew' }
            "let g:fzf_layout = { 'window': '10split enew' }
        " command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--path-to-ignore ~/.ignore --hidden', <bang>0)
    endif
" }


" <NerdCommenter>------------------{
    if &runtimepath =~ 'nerdcommenter'
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
    endif
" }


" <Nerdtree>-------------------{
    if &runtimepath =~ 'nerdtree'
        ">> UI settings
            let NERDTreeQuitOnOpen=1   " Open|Close NERDtree when files was opened
            let NERDTreeMinimalUI=1    " Start NERDTree in minimal UI mode (No help lines)
            let NERDTreeDirArrows=1    " Display arrows instead of ascii art in NERDTree
            "let NERDTreeChDirMode=2    " Change current working directory based on root directory in NERDTree
            let g:NERDTreeHidden=1     " Don't show hidden files
            let NERDTreeWinSize=40     " Initial NERDTree width
            let NERDTreeAutoDeleteBuffer = 1  " Auto delete buffer deleted with NerdTree
            "let NERDTreeShowBookmarks=0   " Show NERDTree bookmarks
            let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '__pycache__', '.git']   " Hide temp files in NERDTree
            "let g:NERDTreeShowLineNumbers=1  " Show Line Number
        " Open Nerdtree when there's no file opened
            "autocmd vimenter * if !argc()|NERDTree|endif
        " Or, auto-open Nerdtree
            "autocmd vimenter * NERDTree
        " Close NERDTree when there's no other windows
            autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        " Customize icons on Nerdtree
            let g:NERDTreeDirArrowExpandable = '▸'
            let g:NERDTreeDirArrowCollapsible = '▾'
        ">> NERDTREE-GIT
        " Special characters
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
    endif

    ">>Nerdtree-devicons
    if &runtimepath =~ 'nerdtree-devicons'
        set guifont=DroidSansMono_Nerd_Font:h11
    endif

    ">> Nerdtree-syntax-highlight
    if &runtimepath =~ 'nerdtree-syntax-highligh'
        let g:NERDTreeDisableFileExtensionHighlight = 1
        let g:NERDTreeDisableExactMatchHighlight = 1
        let g:NERDTreeDisablePatternMatchHighlight = 1
        let g:NERDTreeFileExtensionHighlightFullName = 1
        let g:NERDTreeExactMatchHighlightFullName = 1
        let g:NERDTreePatternMatchHighlightFullName = 1
        let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
        let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
        let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
    endif
" }

" <vim-gitgutter>-------------------------{
    if &runtimepath =~ 'gitgutter' && executable('git')
        let g:gitgutter_enabled = 1
        let g:gitgutter_map_keys = 0  "Cancel pre-set mapping
        " let g:gitgutter_highlight_lines = 1  "Will hide removed line (annoying)
        let g:gitgutter_highlight_linenrs = 1  "highlight line number only
        let g:gitgutter_preview_win_floating = 1  "for vim compatible
        let g:gitgutter_terminal_reports_focus = 0
        let g:gitgutter_diff_base = 'HEAD'
        " let g:gitgutter_diff_relative_to = 'working_tree'
        if executable('ag')
            let g:gitgutter_grep = 'ag'
        elseif executable('rg')
            let g:gitgutter_grep = 'rg'
        else
            let g:gitgutter_grep = 'grep'
        endif
        let g:gitgutter_async = 1
        set updatetime=100
        if has('nvim')
            highlight GitGutterAdd    guifg=#009900 guibg=<X> ctermfg=2
            highlight GitGutterChange guifg=#bbbb00 guibg=<X> ctermfg=3
            highlight GitGutterDelete guifg=#ff2222 guibg=<X> ctermfg=1
        endif
    endif
" }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=================================DEPRECATED PLUGINS===========================
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" [  Plugins Manager vim-plug  ]
"call plug#begin('~/.vim/plugged')
    "Edit
        "Plug 'scrooloose/nerdcommenter'
        "Plug 'brooth/far.vim'
    "Window
        "Plug 'blueyed/vim-diminactive'  "not dim Indent lines
    "Folding
        "Plug 'tmhedberg/SimpylFold'   "improving folding
    "Completion
        "Plug 'valloric/youcompleteme'    "hard to build
        "Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}   "not working
        "Plug 'rkulla/pydiction'   " not work as expected
        "Plug 'ervandew/supertab'
        "Plug 'davidhalter/jedi-vim'  "complicated
        "Plug 'lifepillar/vim-mucomplete'  "tab. sources complicated
            " set completeopt-=preview
            " set completeopt+=longest,menuone,noselect
            " let g:jedi#popup_on_dot = 0  " It may be 1 as well
            " let g:mucomplete#enable_auto_at_startup = 1
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
        "Plug 'rbong/vim-crystalline'  "Too configs to write (error occurs)
    "Syntax Highlighting
        "Plug 'vim-python/python-syntax'
        "Plug 'vitiral/vim-python'  "Not working
        "Plug 'pfdevilliers/Pretty-Vim-Python'   "not working
        "-> Python-mode: (More errors, too many builtin plugins)
        "Plug 'python-mode/python-mode'    "Deprecated
        "Plug 'python-mode/python-mode', { 'branch': 'develop' }
"call plug#end()
