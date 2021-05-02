
Plug 'morhetz/gruvbox'  "Colorscheme
Plug 'Rigellute/shades-of-purple.vim'  "Colorscheme

Plug 'sheerun/vim-polyglot'  "Syntax Highlighting. Ordinary, full support for most language

Plug 'kassio/neoterm'  "Terminal

Plug 'tpope/vim-vinegar'      "Netrw enhancement

Plug 'MattesGroeger/vim-bookmarks'  "Manage bookmarks


Plug 'francoiscabrol/ranger.vim'

Plug 'jreybert/vimagit'  "Much easier with Git
Plug 'tpope/vim-fugitive' "Work with fzf for :Commits

Plug 'TaDaa/vimade'  "Dim inactive windows
Plug 'vim-scripts/ZoomWin' "Zoom In/Out (Error)

Plug 'powerman/vim-plugin-viewdoc' "K-preview improvement

Plug 'junegunn/vim-peekaboo'  "Register enhancement

Plug 'michaeljsmith/vim-indent-object'

"Edit
Plug 'scrooloose/nerdcommenter'
Plug 'brooth/far.vim'

"Folding
Plug 'tmhedberg/SimpylFold'   "improving folding

"Completion
Plug 'valloric/youcompleteme'    "hard to build
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}   "not working
Plug 'ervandew/supertab'

Plug 'davidhalter/jedi-vim'  "complicated

Plug 'lifepillar/vim-mucomplete'  "tab. sources complicated
        " set completeopt-=preview
        " set completeopt+=longest,menuone,noselect
        " let g:jedi#popup_on_dot = 0  " It may be 1 as well
        " let g:mucomplete#enable_auto_at_startup = 1

"Indentation
Plug 'nathanaelkane/vim-indent-guides'

"Brackets
Plug 'tpope/vim-surround'  "Barely working
Plug 'Townk/vim-autoclose' "Fair, but not working for some files

"Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets' "some common snippets (python required)

"Git
Plug 'tpope/vim-fugitive'    "Commands to do Git
Plug 'easymotion/vim-easymotion'

"Markdown
Plug 'JamshedVesuna/vim-markdown-preview' "Not live previewing

"File Browsing
Plug 'Xuyuanp/nerdtree-git-plugin'  " display git status within Nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " enhance devicons
Plug 'wincent/command-t'    "VIM only (Ruby required)
Plug 'justinmk/vim-dirvish'  "Netrw enhancement

"Color Scheme
Plug 'chriskempson/base16-vim'   "Ugly !!
Plug 'jpo/vim-railscasts-theme'  "Ugly !
Plug 'NLKNguyen/papercolor-theme'   "No python support

"Status Bar
Plug 'itchyny/lightline.vim' "beautiful status line
Plug 'Lokaltog/vim-powerline' "fancy status line (python required)
Plug 'rbong/vim-crystalline'  "Too configs to write (error occurs)

"Syntax Highlighting
Plug 'vitiral/vim-python'  "Not working
Plug 'pfdevilliers/Pretty-Vim-Python'   "not working

    "-> Python-mode: (More errors, too many builtin plugins)
Plug 'python-mode/python-mode'    "Deprecated
Plug 'python-mode/python-mode', { 'branch': 'develop' }

Plug 'tpope/vim-obsession'  "For Tmux to restore VIM sessions

Plug 'mgedmin/coverage-highlight.vim'
