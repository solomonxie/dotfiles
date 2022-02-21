""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            MAPPINGS PER PLUGINS                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "[Nerdtree]
" if &runtimepath =~ 'nerdtree'
"     nnoremap <Leader>f :NERDTree<CR>
"     " nnoremap <Leader>F :NERDTree %:p:h<CR>
"     nnoremap <Leader>F :NERDTreeFind<CR>zz
"     " Add '%' for changing root accordingly
"     "nnoremap <Leader>f :NERDTree %:p:h<CR>
"     nnoremap FF :NERDTree<CR>
"     nnoremap ff :NERDTreeFind<CR>zz
" endif

" "[fzf] Fuzzy General Searching
" if &runtimepath =~ 'fzf'
"     "nnoremap <localleader>f :Files %:p:h<CR>
"     nnoremap <M-f> :Files<CR>
"     " nnoremap <LocalLeader>f :Files<CR>
"     " nnoremap <localleader>H :Helptags<CR>
"     " nnoremap <localleader>h :History<CR>
"     " nnoremap <localleader>c :History:<CR>
"     " nnoremap <localleader>/ :History/<CR>
"     " nnoremap <localleader>p :Snippets<CR>
"     " nnoremap <localleader>C :BCommits<CR>
"     " nnoremap <localleader>b :Buffers<CR>
"     " nnoremap <localleader>t :Tags<CR>
"     " nnoremap <LocalLeader>a :Ag<CR>
"     " nnoremap <localleader>m :Marks<CR>
"     "nnoremap <localleader>p/ :Files ..
"     "nnoremap <localleader>color/ :Colors
"     "nnoremap <localleader>k/ :Maps<CR>
"     nnoremap fd :Files<CR>
"     nnoremap fg :GFiles<CR>
"     nnoremap fb :call fzf#vim#buffers(fzf#vim#with_preview('right:0%'))<CR>
"     nnoremap ft :Tags<CR>
"     nnoremap fc :History:<CR>
"     nnoremap fC :Commands<CR>
"     nnoremap fh :History<CR>
"     nnoremap fa :Rg<CR>
"     nnoremap fm :Marks<CR>
"     " nnoremap fa :call fzf#vim#ag('', fzf#vim#with_preview('right'))<CR>
"     nnoremap fs :Snippets<CR>
"     " nnoremap fS :History/<CR>
"     " nnoremap fm :Marks<CR>
" endif

" "[Vim-GitGutter]
" if &runtimepath =~ 'gitgutter' && executable('git')
"     " nnoremap ]h :GitGutterNextHunk<CR>
"     " nnoremap [h :GitGutterPrevHunk<CR>
"     " Changed Hunks
"     " nnoremap gn :GitGutterNextHunk<CR>
"     " nnoremap gp :GitGutterPrevHunk<CR>
"     " nnoremap gP :GitGutterPreviewHunk<CR>
"     nnoremap [p :GitGutterPreviewHunk<CR>
"     nnoremap ]p :GitGutterPreviewHunk<CR>
"     " Toggle/fold changed lines
"     nnoremap gz :GitGutterFold<CR>
"     " Diff
"     command! ChangeGitDiffBase let g:gitgutter_diff_base = 'master'
" endif

" "[Tagbar]
" if &runtimepath =~ 'tagbar' " hit * ->open all folds; = ->close all folds
"     "noremap <Leader>t :TagbarToggle<CR>=<ESC>
"     noremap T :TagbarToggle<CR>
" endif

" "[Vista]
" if &runtimepath =~ 'vista' " hit * ->open all folds; = ->close all folds
"     "noremap <Leader>t :TagbarToggle<CR>=<ESC>
"     " noremap tt :Vista!!<CR>
"     noremap tt :Vista show<CR>
" endif

" "[AnyJump] >>>Find usages
" if &runtimepath =~ 'any-jump'
"     nnoremap fu :AnyJump<CR>
" endif


" " [Telescope]
" if &runtimepath =~ 'telescope'
"     nnoremap <leader>gf <cmd>lua require('telescope.builtin').find_files()<cr>
"     nnoremap <leader>gg <cmd>lua require('telescope.builtin').live_grep()<cr>
"     nnoremap <leader>gb <cmd>lua require('telescope.builtin').buffers()<cr>
"     nnoremap <leader>gt <cmd>lua require('telescope.builtin').help_tags()<cr>
" endif

" "[Jedi]
" if &runtimepath =~ 'jedi-vim'
"     " nnoremap <Leader>d :call jedi#goto_definitions()<CR>
"     nnoremap <Leader>d :call jedi#goto()<CR>
"     nnoremap <Leader>n :call jedi#usages()<CR>
" endif

" "[Ranger]
" if &runtimepath =~ 'ranger' && executable('ranger')
"     let g:ranger_map_keys = 0
"     "nnoremap <Leader>F :Ranger<CR>
" endif

" "[Linter]
" if &runtimepath =~ 'syntastic'
"     " nnoremap <C-n> :lnext<CR>
"     " nnoremap <C-p> :lprevious<CR>
"     " Go Error Next
"     nnoremap gen :lnext<CR>
"     " Go Error Previous
"     nnoremap gep :lprevious<CR>
"     " nnoremap <LocalLeader>s :SyntasticCheck<CR>
" endif

" "[ALE]
" if &runtimepath =~ 'ale'
"     " Go Error Next
"     nnoremap <C-n> :ALENext<CR>
"     " Go Error Previous
"     nnoremap <C-p> :ALEPrevious<CR>
"     " nnoremap <LocalLeader>s :SyntasticCheck<CR>
" endif

" "[Undotree]
" if &runtimepath =~ 'undotree'
"     nnoremap <LocalLeader>d :UndotreeToggle<CR>:UndotreeFocus<CR>
" endif

" "[Auto-pair]
" if &runtimepath =~ 'auto-pair'
"     "imap <C-d> <Meta>
"     "imap <C-d>e <M-e>
" endif

"[Command-T] Fuzzy Searching
    "nnoremap <localleader>/ :CommandT<CR>
    "nnoremap <localleader>c :CommandT<CR>

"[Fzy] Fuzzy Searching
"...

" "[Nerdtree Tabs]
" if &runtimepath =~ 'nerdtree-tabs'
"     " Shift Tabs
"     "nnoremap <C-h> gt
"     "nnoremap <C-l> gT
"     " New Tab
"     "nnoremap <Leader>t :tabe<CR>
"     " Close Tab
"     "nnoremap <Leader>c :tabc
" endif
"
" "[NerdCommenter]
" if &runtimepath =~ 'nerdcommenter'
"     "map <Leader>/ :normal ,cc<CR>
"     "nnoremap ` :normal ,cc<CR>
"     "nnoremap ~ :normal ,ci<CR>
"     "map <Leader>/ :normal ,cu<CR>
"     "map <Leader>/ :normal ,ci<CR>
" endif
"
" "[Vim-Clap]
" if &runtimepath =~ 'clap'
"     " nnoremap fgg :Clap grep<CR>
"     " nnoremap fgf :Clap gfiles<CR>
"     " nnoremap fgh :Clap history<CR>
"     " nnoremap fgb :Clap buffers<CR>
" endif
"
" "Airline Buffers
" if &runtimepath =~ 'vim-airline'
"     " nmap <Leader>1 <Plug>AirlineSelectTab1
"     " nmap <Leader>2 <Plug>AirlineSelectTab2
"     " nmap <Leader>3 <Plug>AirlineSelectTab3
"     " nmap <Leader>4 <Plug>AirlineSelectTab4
"     " nmap <Leader>5 <Plug>AirlineSelectTab5
"     " nmap <Leader>6 <Plug>AirlineSelectTab6
"     " nmap <Leader>7 <Plug>AirlineSelectTab7
"     " nmap <Leader>8 <Plug>AirlineSelectTab8
"     " nmap <Leader>9 <Plug>AirlineSelectTab9
" endif
"
" "[Vim-zoom]
" if &runtimepath =~ 'vim-zoom'
"     "nmap mm <Plug>(zoom-toggle)
" endif
"
" "[nnn]
" if &runtimepath =~ 'nnn'
"     "nnoremap <LocalLeader>F :NnnPicker<CR>
" endif
"
" "[Vimagit]
" if &runtimepath =~ 'tig-explorer' && executable('tig')
"     "let g:magit_show_magit_mapping='<Leader>G'
"     "let g:magit_show_magit_mapping='<Leader>g'
" endif
"
" "[Tig-Explorer]
" if &runtimepath =~ 'tig-explorer' && executable('tig')
"     "nnoremap <localleader>g :Tig<CR>
"     "nnoremap <localleader>G :TigOpenCurrentFile<CR>
" endif

"[Plugin Manager]
    "noremap <localleader>i :PlugInstall<CR>

"<Undefined>
    "noremap - <NOP>
    "noremap = <NOP>
    " nnoremap <C-o> <C-o>
    " nnoremap <C-i> <C-i>

"<Files>
    "{Save file}
    "noremap  <Leader>s <ESC>:w<CR><ESC>
    "{Save & Exit}
    " noremap  <C-x> <ESC>:x<CR><ESC>
    "noremap <Leader>j :jumps<CR>
    " noremap <Leader>o :browse oldfiles<CR>



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
