"-----------------------------------------------------------------------
"          __     ___             _____ _                              -
"          \ \   / (_)_ __ ___   |_   _| |__   ___ _ __ ___   ___      -
"           \ \ / /| | '_ ` _ \    | | | '_ \ / _ \ '_ ` _ \ / _ \     -
"            \ V / | | | | | | |   | | | | | |  __/ | | | | |  __/     -
"             \_/  |_|_| |_| |_|   |_| |_| |_|\___|_| |_| |_|\___|     -
"                                                                      -
"----------------------------GENERATED-BY-FIGLET------------------------


" [  Builtin UI / Color Scheme  ]---------{
    " <Basic Settings>
        set t_Co=256   ">> Overwriting Alert !!
        set background=dark   ">> Overwriting Alert !!
        set cursorline  "Highlighting current line
        set fillchars+=vert:\!  "Bar character for VERTical Split Pane
        autocmd WinEnter * set cursorline
        autocmd WinLeave * set nocursorline

    " <Line Number>
        " turn hybrid line numbers on
        "set number relativenumber
        "set nu rnu
        set nu
        " Automatic toggling between line number modes
        "augroup numbertoggle
          "autocmd!
          "autocmd FocusGained,InsertLeave * set relativenumber
          "autocmd FocusLost,InsertEnter   * set norelativenumber
        "augroup END

    "<FileType>
        filetype plugin on    " [essential]
        filetype plugin indent on

    " <Syntax Highlighting>  --> Overwriting Alert!
        syntax enable

    " <Color Scheme>  --> Overwriting Alert!
        "{True Color Support: Vim-specific sequences for RGB colors}
        set termguicolors   ">> Not compatiple with many themes
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        "{THEME}
        "colorscheme material-monokai ">> Super slow, has block color comment
        colorscheme gruvbox ">> grubox is slow for old machine
        " colorscheme shades_of_purple ">> Require the plugin
        "let g:gruvbox_contrast_dark='hard' "[hard|medium|soft]
        " -> Alternative
            "colorscheme monokai "Fast (sickill/vim-monokai)
            "highlight Normal ctermbg=NONE
            "highlight nonText ctermbg=NONE

    " <Highlight Settings>  --> Overwriting Alert!
        "hi! VertSplit guifg=red guibg=blue term=None
        "hi Normal ctermbg=White ctermfg=Black guifg=Black guibg=White

    " <Spell Check>
        autocmd BufRead,BufNewFile *.txt,*.md setlocal spell spelllang=en,en_us,cjk
        autocmd FileType gitcommit setlocal spell spelllang=en,en_us,cjk

    " <NetRW File Tree>
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


" [  Search Highlighting  ]-----------{
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
" }


" <Vim-DimInactive>-----------{
    if &runtimepath =~ 'diminactive'
        let g:diminactive_use_colorcolumn = 2
        let g:diminactive_use_syntax = 0
    endif
" }


" <Nerdtree>-------------------{
    if &runtimepath =~ 'nerdtree'
        ">> UI settings
            let NERDTreeQuitOnOpen=1   " Close NERDtree when files was opened
            let NERDTreeMinimalUI=1    " Start NERDTree in minimal UI mode (No help lines)
            let NERDTreeDirArrows=1    " Display arrows instead of ascii art in NERDTree
            "let NERDTreeChDirMode=2    " Change current working directory based on root directory in NERDTree
            let g:NERDTreeHidden=1     " Don't show hidden files
            let NERDTreeWinSize=40     " Initial NERDTree width
            let NERDTreeAutoDeleteBuffer = 1  " Auto delete buffer deleted with NerdTree
            "let NERDTreeShowBookmarks=0   " Show NERDTree bookmarks
            let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '__pycache__']   " Hide temp files in NERDTree
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


" <Status-Line>-----------{
    " @airline
    if &runtimepath =~ 'airline'
        set t_Co=256 "For Windows
        let g:airline#extensions#tabline#enabled = 1  "Enable airline
        let g:airline_powerline_fonts=1 "Essential
        set laststatus=2  "2:always show
        let g:airline_left_sep = '▶'
        let g:airline_left_alt_sep = '❯'
        let g:airline_right_sep = '◀'
        let g:airline_right_alt_sep = '❮'
        " @airline-extension-theme
            "let g:airline_theme='gruvbox'  "grubox|deus|badwolf|solarized
            let g:airline_theme='bubblegum' "Default
            " let g:shades_of_purple_airline = 1
            " let g:airline_theme='shades_of_purple'
        " @airline-extensions-tabline-tabs
            let g:airline#extensions#tabline#switch_buffers_and_tabs=0
            let g:airline#extensions#tabline#enabled=1  "enable tabline
            let g:airline#extensions#tabline#tabs_label='TABS'
            let g:airline#extensions#tabline#show_tab_nr=0 "enable tag number
            let g:airline#extensions#tabline#tab_nr_type=1 "Numbers shown
            "-> default|unique_tail|unique_tail_improved
            let g:airline#extensions#tabline#formatter='unique_tail'
            "let g:airline#extensions#tabline#left_sep = ' '  "separater
            "let g:airline#extensions#tabline#left_alt_sep = '|'  "separater
        " @airline-extension-tabline-buffers
            let g:airline#extensions#tabline#show_buffers=1
            let g:airline#extensions#tabline#buffers_label='BUFFERS'
            let g:airline#extensions#tabline#buffer_nr_show=0
            let g:airline#extensions#tabline#buffer_idx_mode=0
            "let g:airline#extensions#tabline#buffer_idx_format={}
        " @airline-extensions-tabline-splits
            let g:airline#extensions#tabline#show_splits=1 "show split
    endif

    " @lightline
    if &runtimepath =~ 'lightline'
        set laststatus=2 " startup the lightline.vim
        let g:lightline = { 'colorscheme': 'powerline', }
    endif

    " @powerline
    if &runtimepath =~ 'powerline'
        set t_Co=256
        set encoding=utf8
        let g:Powerline_symbols= 'unicode'
        set laststatus=2
    endif

    " @crystalline
    if &runtimepath =~ 'crystalline'
        function! StatusLine(current, width)
            let l:s = ''
            if a:current
            let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
            else
            let l:s .= '%#CrystallineInactive#'
            endif
            let l:s .= ' %f%h%w%m%r '
            if a:current
            let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()}'
            endif
            let l:s .= '%='
            if a:current
            let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
            let l:s .= crystalline#left_mode_sep('')
            endif
            if a:width > 80
            let l:s .= ' %{&ft}[%{&enc}][%{&ffs}] %l/%L %c%V %P '
            else
            let l:s .= ' '
            endif
            return l:s
        endfunction
        function! TabLine()
            let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
            return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
        endfunction
        let g:crystalline_enable_sep = 1
        let g:crystalline_statusline_fn = 'StatusLine'
        let g:crystalline_tabline_fn = 'TabLine'
        let g:crystalline_theme = 'default'
        set showtabline=2
        set guioptions-=e
        set laststatus=2
    endif
" }

