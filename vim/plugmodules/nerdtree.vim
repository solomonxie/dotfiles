Plug 'scrooloose/nerdtree'          " File tree manager
Plug 'jistr/vim-nerdtree-tabs'      " enhance nerdtree's tabs
Plug 'ryanoasis/vim-devicons'       " add beautiful icons besides files

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
