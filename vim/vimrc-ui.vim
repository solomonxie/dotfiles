"-----------------------------------------------------------------------
"          __     ___             _____ _                              -
"          \ \   / (_)_ __ ___   |_   _| |__   ___ _ __ ___   ___      -
"           \ \ / /| | '_ ` _ \    | | | '_ \ / _ \ '_ ` _ \ / _ \     -
"            \ V / | | | | | | |   | | | | | |  __/ | | | | |  __/     -
"             \_/  |_|_| |_| |_|   |_| |_| |_|\___|_| |_| |_|\___|     -
"                                                                      -
"----------------------------GENERATED-BY-FIGLET------------------------


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         GENERAL UI / COLOR SCHEME                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Syntax Highlighting>  Better to be in the front
    syntax enable

"<FileType>
    filetype plugin on    " [essential]
    filetype plugin indent on

" <Basic Settings>
    set t_Co=256   ">> Overwriting Alert !!
    set background=dark   ">> Overwriting Alert !!

    "[CAREFUL!!!] >> Ugly when working with other themes & syntax highlighting plugins
    " set termguicolors  "{True Color Support} Vim-specific sequences for RGB colors
    set notermguicolors  "Turn off -> when on, bg-color will affect the whole look

    set cursorline  "Highlighting current line
    set fillchars+=vert:\!  "Bar character for VERTical Split Pane

    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline

" <Line Number>
    " turn hybrid line numbers on
    " set number relativenumber
    set number norelativenumber
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
"                           COLORS SCHEME / THEMES                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme gruvbox ">> grubox is slow for old machine
colorscheme badwolf
"let g:gruvbox_contrast_dark='hard' "[hard|medium|soft]
" -> Alternative
    "colorscheme monokai ">> Super slow, has block color comment
    "colorscheme monokai "Fast (sickill/vim-monokai)
    "colorscheme shades_of_purple ">> Require the plugin
"Colorscheme based on filetype --{
    "autocmd FileType python colorscheme gruvbox
    " autocmd FileType vim,tmux,sh,txt,dockerfile colorscheme badwolf
" }


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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               PLUGIN RELATED                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" THIS IS REQUIRED BY PLUGIN TO LOAD AFTER SETTING COLORSCHEME

highlight HighlightedyankRegion cterm=reverse gui=reverse
