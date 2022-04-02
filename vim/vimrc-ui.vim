"-----------------------------------------------------------------------
"          __     ___             _____ _                              -
"          \ \   / (_)_ __ ___   |_   _| |__   ___ _ __ ___   ___      -
"           \ \ / /| | '_ ` _ \    | | | '_ \ / _ \ '_ ` _ \ / _ \     -
"            \ V / | | | | | | |   | | | | | |  __/ | | | | |  __/     -
"             \_/  |_|_| |_| |_|   |_| |_| |_|\___|_| |_| |_|\___|     -
"                                                                      -
"----------------------------GENERATED-BY-FIGLET------------------------

"REF: http://bytefluent.com/devify/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           COLORS SCHEME / THEMES                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"==========> GRUVBOX ============>>>>
" colorscheme gruvbox ">> grubox is slow for old machine
"let g:gruvbox_contrast_dark='hard' "[hard|medium|soft]

"==========> BADWOLF ============>>>>
" Plug 'solomonxie/badwolf'
"FILE: ./colors/badwolf.vim
let g:enable_badwolf_plugin = 0
let g:enable_badwolf_filetype = 1
let g:enable_badwolf_vim = 0
let g:enable_badwolf_python = 0
let g:enable_badwolf_ctrlp = 0
let g:enable_badwolf_easymotion = 0
let g:enable_badwolf_intersting_words = 0
let g:enable_badwolf_makegreen = 0
let g:enable_badwolf_rainbow_parentheses = 0
let g:enable_badwolf_show_marks = 0
let g:enable_badwolf_clojure = 0
let g:enable_badwolf_common_lisp = 0
let g:enable_badwolf_css = 0
let g:enable_badwolf_diff = 0
let g:enable_badwolf_django_templates = 0
let g:enable_badwolf_html = 0
let g:enable_badwolf_java = 0
let g:enable_badwolf_latex = 0
let g:enable_badwolf_less_css = 0
let g:enable_badwolf_lispyscript = 0
let g:enable_badwolf_repls = 0
let g:enable_badwolf_mail = 0
let g:enable_badwolf_markdown = 0
let g:enable_badwolf_mysql = 0
let g:enable_badwolf_slimv = 0
colorscheme badwolf  "16ms after my fork

" ==========> ALTERNATIVES ===========>
    "colorscheme gruvbox  "20ms
    "colorscheme cobalt2 "100ms
    "colorscheme monokai "7ms. Fast (sickill/vim-monokai)
    "colorscheme shades_of_purple ">> Require the plugin

" ==========> Colorscheme based on filetype ===========>
    "autocmd FileType python colorscheme gruvbox
    "autocmd FileType vim,tmux,sh,txt,dockerfile colorscheme badwolf


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         GENERAL UI / COLOR SCHEME                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function SetSyntax()
    let b:max_line = 5000
    if line('$') <= b:max_line "&& &syntax != 'manual'
        syntax manual
        set syntax=on
        filetype plugin on    " [essential]
        filetype plugin indent on
    else
        set syntax=off
        filetype plugin off    " [essential]
        filetype plugin indent off
    endif
endfunction

" <Syntax Highlighting>  Better to be in the front
    syntax on  "Speed: off > manual > on > enable

    ""ULTIMATE PERFORMANCE STRATEGY: disable syntax at start, then lazy load on buffer level
    "syntax off  "Speed: off > manual > on > enable
    " autocmd BufEnter *.py,*.js,*.md,*.sql,*.json,*.json.gz,*.yaml,*.yml,*.csv,*.csv.gz,*.vim,*.sh,*.zsh,zshrc*,Makefile*,*.snippets call SetSyntax()
    " autocmd FileType nerdtree call SetSyntax()
    " autocmd FileType vista call SetSyntax()
    " autocmd BufRead *.json.gz set filetype=json

    let python_highlight_all = 1  "FOR vim/syntax/python.vim (FROM WEB)
"<FileType>
    " filetype plugin on    " [essential]
    " filetype plugin indent on

" <Basic Settings>
    set t_Co=256   ">> Overwriting Alert !!
    " set termguicolors  "{True Color Support} Vim-specific sequences for RGB colors
    set notermguicolors  "Turn off -> when on, bg-color will affect the whole look
    set background=dark   ">> Overwriting Alert !!

    "[CAREFUL!!!] >> Ugly when working with other themes & syntax highlighting plugins
    set fillchars+=vert:\|  "Bar character for VERTical Split Pane

" =={NUMBER LINE}==
    " turn hybrid line numbers on
    " set number relativenumber
    set number norelativenumber
    " highlight! LineNr ctermfg=gray ctermbg=black cterm=NONE guibg=black guifg=gray
    " highlight! SignColumn ctermfg=gray ctermbg=black cterm=NONE guibg=black guifg=gray
    " Automatic toggling between line number modes
    " augroup AutoToggleRelativeNumber
    "   autocmd!
    "   autocmd FocusGained,InsertLeave * set relativenumber
    "   autocmd FocusLost,InsertEnter   * set norelativenumber
    " augroup END

    "MUST GO BEFORE `colorscheme` and after `autocmd`
    " autocmd ColorScheme * highlight Normal ctermbg=None
    " autocmd ColorScheme * highlight NonText ctermbg=None

" <Spell Check>
    autocmd BufRead,BufNewFile *.txt,*.md setlocal spell spelllang=en,en_us,cjk
    autocmd FileType gitcommit setlocal spell spelllang=en,en_us,cjk

" <Length Marker>
    " highlight OverLength ctermbg=red ctermfg=white  "> Warning color
    " let &colorcolumn=join(range(120,999),",")  "> Warning Column

    "match OverLength /\%81v.\+/

    "> or
    " let &colorcolumn="120,".join(range(400,999),",")
    "> or
    "set colorcolumn=80
    "highlight ColorColumn guibg=#155460
    "> or
    "highlight ColorColumn ctermbg=grey
    "> or
    "highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                HIGHLIGHTING                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>
    set showmatch
    set matchtime=3
    highlight Search guibg='Purple' guifg='NONE'
    highlight IncSearch gui=underline,bold guifg=White guibg=Red3
    "highlight IncSearch ctermbg=black ctermfg=yellow
"Cancel Highlighting when mouse on idle
    "autocmd cursorhold * set nohlsearch
"Highlight on paired braket
    "highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE"

" <Highlight Settings>  --> Overwriting Alert!
    "-----> Has to be after loading colorscheme
    " highlight! Normal ctermbg=NONE
    "highlight! nonText ctermbg=NONE
    "highlight! VertSplit guifg=red guibg=blue term=None
    "highlight! Normal ctermbg=White ctermfg=Black guifg=Black guibg=White
    " highlight! Normal ctermfg=grey ctermbg=black  "Set background color
    " highlight Normal guibg=black

" =={CURSOR LINE}==
    " REF: https://jonasjacek.github.io/colors/
    " REF: https://vi.stackexchange.com/questions/23066/change-cursorline-style
    set cursorline  "Highlighting current line
    " autocmd WinEnter * set cursorline
    " autocmd WinLeave * set nocursorline
    highlight! CursorLine cterm=NONE ctermfg=NONE ctermbg=237  "Grey
    highlight! CursorLineNr cterm=NONE ctermfg=11 gui=bold guifg=Yellow
    " highlight! CursorLine cterm=NONE ctermfg=NONE ctermbg=214  "Orange
    " highlight! CursorLine cterm=NONE ctermfg=NONE ctermbg=161  "Deep Pink
    " highlight! CursorLine cterm=NONE ctermfg=NONE ctermbg=8  "Grey
    " highlight! CursorLine cterm=NONE ctermfg=NONE ctermbg=88  "Dark Red
    " highlight! CursorLine cterm=NONE ctermfg=NONE ctermbg=89  "Pink
    " highlight! CursorLine cterm=NONE ctermfg=NONE ctermbg=90  "Dark Magenta
    " highlight! CursorLine cterm=underline ctermfg=NONE ctermbg=236  "Dark Magenta
    " highlight! CursorLineNR cterm=NONE ctermfg=NONE ctermbg=89  "Pink

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               PLUGIN RELATED                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" THIS IS REQUIRED BY PLUGIN TO LOAD AFTER SETTING COLORSCHEME

highlight HighlightedyankRegion cterm=reverse gui=reverse
