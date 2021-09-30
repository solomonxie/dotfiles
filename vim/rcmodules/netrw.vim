"<NetRW File Tree>
" ============================================================================
" Netrw Directory Listing                                        (netrw v170)
"   /Users/xiaoboxie/myconf/dotfiles
"   Sorted by      name
"   Sort sequence: [\/]$,\<core\%(\.\d\+\)\=\>,\.h$,\.c$,\.cpp$,\~\=\*$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$
"   Hiding:        \(^\|\s\s\)\zs\.\S\+
"   Quick Help: <F1>:help  -:go up dir  D:delete  R:rename  s:sort-by  x:special
" ==============================================================================
" HELP LINKS ===>
" :help netrw-quickmap

let g:netrw_banner=0
let g:netrw_hide=1
let g:netrw_browse_split=4  "How files are opened"
let g:netrw_liststyle=3  "Directory view in netrw"
let g:netrw_altv = 2
let g:netrw_winsize=30
let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'


autocmd FileType netrw setl bufhidden=wipe
autocmd FileType netrw setl bufhidden=delete

let g:netrw_fastbrowse = 0
function! CloseNetrw() abort
    for bufn in range(1, bufnr('$'))
        if bufexists(bufn) && getbufvar(bufn, '&filetype') ==# 'netrw'
            silent! execute 'bwipeout ' . bufn
            if getline(2) =~# '^" Netrw '
                silent! bwipeout
            endif
            return
        endif
    endfor
endfunction

augroup closeOnOpen
    autocmd!
    autocmd BufWinEnter * if getbufvar(winbufnr(winnr()), "&filetype") != "netrw"|call CloseNetrw()|endif
aug END

nnoremap <Leader>f :Lexplore .<CR>
" nnoremap <Leader>F :NERDTreeFind<CR>zz
" nnoremap FF :NERDTree<CR>
" nnoremap ff :NERDTreeFind<CR>zz
" ===> More mappings inside netrw ->
" vim/after/ftplugin/netrw.vim

command! ExploreFind let @/=expand("%:t") | execute 'Lexplore ' expand('%:h') | normal n
nnoremap ff :let @/=expand('%:t')<Bar>execute 'Lexplore' expand('%:h')<Bar>normal n<CR>


"   ---         -----------------           ----
"   Map         Quick Explanation           Link
"   ---         -----------------           ----
"  <F1> Causes Netrw to issue help
"  <cr> Netrw will enter the directory or read the file      |netrw-cr|
"  <del>    Netrw will attempt to remove the file/directory      |netrw-del|
"  <c-h>    Edit file hiding list                                |netrw-ctrl-h|
"  <c-l>    Causes Netrw to refresh the directory listing        |netrw-ctrl-l|
"  <c-r>    Browse using a gvim server                           |netrw-ctrl-r|
"  <c-tab> Shrink/expand a netrw/explore window                |netrw-c-tab|
"    -  Makes Netrw go up one directory                      |netrw--|
"    a  Toggles between normal display,                      |netrw-a|
"       hiding (suppress display of files matching g:netrw_list_hide)
"       showing (display only files which match g:netrw_list_hide)
"    c  Make browsing directory the current directory        |netrw-c|
"    C  Setting the editing window                           |netrw-C|
"    d  Make a directory                                     |netrw-d|
"    D  Attempt to remove the file(s)/directory(ies)         |netrw-D|
"    gb Go to previous bookmarked directory                  |netrw-gb|
"    gd Force treatment as directory                         |netrw-gd|
"    gf Force treatment as file                              |netrw-gf|
"    gh Quick hide/unhide of dot-files                       |netrw-gh|
"    gn Make top of tree the directory below the cursor      |netrw-gn|
"    i  Cycle between thin, long, wide, and tree listings    |netrw-i|
"    mb Bookmark current directory                           |netrw-mb|
"    mc Copy marked files to marked-file target directory    |netrw-mc|
"    md Apply diff to marked files (up to 3)                 |netrw-md|
"    me Place marked files on arg list and edit them         |netrw-me|
"    mf Mark a file                                          |netrw-mf|
"    mF Unmark files                                         |netrw-mF|
"    mg Apply vimgrep to marked files                        |netrw-mg|
"    mh Toggle marked file suffices' presence on hiding list |netrw-mh|
"    mm Move marked files to marked-file target directory    |netrw-mm|
"    mp Print marked files                                   |netrw-mp|
"    mr Mark files using a shell-style |regexp|                |netrw-mr|
"    mt Current browsing directory becomes markfile target   |netrw-mt|
"    mT Apply ctags to marked files                          |netrw-mT|
"    mu Unmark all marked files                              |netrw-mu|
"    mv Apply arbitrary vim   command to marked files        |netrw-mv|
"    mx Apply arbitrary shell command to marked files        |netrw-mx|
"    mX Apply arbitrary shell command to marked files en bloc|netrw-mX|
"    mz Compress/decompress marked files                     |netrw-mz|
"    o  Enter the file/directory under the cursor in a new   |netrw-o|
"       browser window.  A horizontal split is used.
"    O  Obtain a file specified by cursor                    |netrw-O|
"    p  Preview the file                                     |netrw-p|
"    P  Browse in the previously used window                 |netrw-P|
"    qb List bookmarked directories and history              |netrw-qb|
"    qf Display information on file                          |netrw-qf|
"    qF Mark files using a quickfix list                     |netrw-qF|
"    qL Mark files using a |location-list|                     |netrw-qL|
"    r  Reverse sorting order                                |netrw-r|
"    R  Rename the designated file(s)/directory(ies)         |netrw-R|
"    s  Select sorting style: by name, time, or file size    |netrw-s|
"    S  Specify suffix priority for name-sorting             |netrw-S|
"    t  Enter the file/directory under the cursor in a new tab|netrw-t|
"    u  Change to recently-visited directory                 |netrw-u|
"    U  Change to subsequently-visited directory             |netrw-U|
"    v  Enter the file/directory under the cursor in a new   |netrw-v|
"       browser window.  A vertical split is used.
"    x  View file with an associated program                 |netrw-x|
"    X  Execute filename under cursor via |system()|           |netrw-X|
"
"    %  Open a new file in netrw's current directory         |netrw-%|
"
" *netrw-mouse* *netrw-leftmouse* *netrw-middlemouse* *netrw-rightmouse*
" <leftmouse>   (gvim only) selects word under mouse as if a <cr>
"       had been pressed (ie. edit file, change directory)
" <middlemouse> (gvim only) same as P selecting word under mouse;
"       see |netrw-P|
" <rightmouse>  (gvim only) delete file/directory using word under
"       mouse
" <2-leftmouse> (gvim only) when:
"        * in a netrw-selected file, AND
"        * |g:netrw_retmap| == 1       AND
"        * the user doesn't already have a <2-leftmouse>
"          mapping defined before netrw is autoloaded,
"       then a double clicked leftmouse button will return
"       to the netrw browser window.  See |g:netrw_retmap|.
" <s-leftmouse> (gvim only) like mf, will mark files.  Dragging
"       the shifted leftmouse will mark multiple files.
"       (see |netrw-mf|)
"
" (to disable mouse buttons while browsing: |g:netrw_mousemaps|)
"
"           *netrw-quickcom* *netrw-quickcoms*
"QUICK REFERENCE: COMMANDS  *netrw-explore-cmds* *netrw-browse-cmds* {{{2
"     :NetrwClean[!]............................................|netrw-clean|
"     :NetrwSettings............................................|netrw-settings|
"     :Ntree....................................................|netrw-ntree|
"     :Explore[!]  [dir] Explore directory of current file......|netrw-explore|
"     :Hexplore[!] [dir] Horizontal Split & Explore.............|netrw-explore|
"     :Lexplore[!] [dir] Left Explorer Toggle...................|netrw-explore|
"     :Nexplore[!] [dir] Vertical Split & Explore...............|netrw-explore|
"     :Pexplore[!] [dir] Vertical Split & Explore...............|netrw-explore|
"     :Rexplore          Return to Explorer.....................|netrw-explore|
"     :Sexplore[!] [dir] Split & Explore directory .............|netrw-explore|
"     :Texplore[!] [dir] Tab & Explore..........................|netrw-explore|
"     :Vexplore[!] [dir] Vertical Split & Explore...............|netrw-explore|
