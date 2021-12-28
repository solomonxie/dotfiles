--REF: https://github.com/scrooloose/nerdtree

--LOAD SIGNIFICANTLY FASTER
--REF: https://github.com/preservim/nerdtree/issues/276
use 'git@github.com:scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTree'] }

-- use 'scrooloose/nerdtree'  --, {'on': ['NERDTree', 'NERDTreeFind', 'NERDTreeToggle']}
-- use 'jistr/vim-nerdtree-tabs'      -- enhance nerdtree's tabs
-- use 'ryanoasis/vim-devicons'       -- add beautiful icons besides files
-- use 'tiagofumo/vim-nerdtree-syntax-highlight'  --Slow down vim significantly

-->> Key Mappings
nnoremap <Leader>f :NERDTree<CR>
-- nnoremap <Leader>F :NERDTree %:p:h<CR>
nnoremap <Leader>F :NERDTreeFind<CR>zz
-- Add '%' for changing root accordingly
--nnoremap <Leader>f :NERDTree %:p:h<CR>
nnoremap FF :NERDTree<CR>
nnoremap ff :NERDTreeFind<CR>zz

-->> UI settings
let NERDTreeQuitOnOpen=1   -- Open|Close NERDtree when files was opened
let NERDTreeMinimalUI=1    -- Start NERDTree in minimal UI mode (No help lines)
let NERDTreeDirArrows=1    -- Display arrows instead of ascii art in NERDTree
let NERDTreeHighlightCursorline = 1  --Conflict with other addon-plugins for nerdtree
--let NERDTreeChDirMode=2    -- Change current working directory based on root directory in NERDTree
let g:NERDTreeHidden=1     -- Don't show hidden files
let NERDTreeWinSize=40     -- Initial NERDTree width
let NERDTreeAutoDeleteBuffer = 1  -- Auto delete buffer deleted with NerdTree
--let NERDTreeShowBookmarks=0   -- Show NERDTree bookmarks
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '__pycache__', 'node_modules']   -- Hide temp files in NERDTree
--let g:NERDTreeShowLineNumbers=1  -- Show Line Number

--let NERDTreeAutoCenter = 1  --Not working

-- Open Nerdtree when there's no file opened
--autocmd vimenter * if !argc()|NERDTree|endif
-- Or, auto-open Nerdtree
--autocmd vimenter * NERDTree
-- Close NERDTree when there's no other windows
autocmd BufEnter * if (winnr(--$--) == 1 && exists(--b:NERDTree--) && b:NERDTree.isTabTree()) | q | endif

-- Customize icons on Nerdtree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

-- Git related
-- Special characters
let g:NERDTreeIndicatorMapCustom = {
    \ --Modified--  : --✹--,
    \ --Staged--    : --✚--,
    \ --Untracked-- : --✭--,
    \ --Renamed--   : --➜--,
    \ --Unmerged--  : --═--,
    \ --Deleted--   : --✖--,
    \ --Dirty--     : --✗--,
    \ --Clean--     : --✔︎--,
    \ 'Ignored'   : '☒',
    \ --Unknown--   : --?--
\ }


------------------------------------------------------------------------------------------------------------------------------------------------------------
--                      Customized Abilities on Nerdtree                      --
------------------------------------------------------------------------------------------------------------------------------------------------------------
-- call NERDTreeAddKeyMap({
--         \ 'key': 'E',
--         \ 'callback': 'MyNerdtreeFunc',
--         \ 'quickhelpText': 'put full path of current node into the default register' })
--
-- function! MyNerdtreeFunc()
--     let n = g:NERDTreeFileNode.GetSelected()
--     if n != {}
--         call setreg('--', n.path.str())
--     endif
-- endfunction


--https://github.com/ryanoasis/vim-devicons/wiki/Extra-Configuration
if &runtimepath =~ 'vim-devicons'
    let g:webdevicons_enable = 1  --Enable plugin
    let g:webdevicons_enable_nerdtree = 1
    let g:webdevicons_enable_airline_tabline = 0
    let g:webdevicons_enable_airline_statusline = 0
    set guifont=DroidSansMono_Nerd_Font:h11
endif

--https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
if &runtimepath =~ 'nerdtree-syntax-highlight'
    let g:NERDTreeFileExtensionHighlightFullName = 1
    let g:NERDTreeExactMatchHighlightFullName = 1
    let g:NERDTreePatternMatchHighlightFullName = 1
    let g:NERDTreeHighlightFolders = 1 -- enables folder icon highlighting using exact match
    let g:NERDTreeHighlightFoldersFullName = 1 -- highlights the folder name
    let g:NERDTreeExtensionHighlightColor = {} -- this line is needed to avoid error
    let g:NERDTreeLimitedSyntax = 1  --Disable uncommon file extensions highlighting
    -- Disable
    -- let g:NERDTreeDisableFileExtensionHighlight = 1
    -- let g:NERDTreeDisableExactMatchHighlight = 1
    -- let g:NERDTreeDisablePatternMatchHighlight = 1
endif
