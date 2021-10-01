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

" command! ExploreFind let @/=expand("%:t") | execute 'Lexplore ' expand('%:h') | normal n
nnoremap ff :silent execute "let @/=expand('%:t')<Bar>silent execute 'Lexplore' expand('%:h')<Bar>normal n"<CR>
