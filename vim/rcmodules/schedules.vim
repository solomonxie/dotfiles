" function! s:gitsign_refresh(...) abort
"     if &runtimepath =~ 'gitsigns'
"         " :Gitsigns refresh()<CR>
"         lua vim.defer_fn(require'gitsigns'.refresh, 150)
"         echo 'done'
"     endif
" endfunction
" call timer_start(1000, function('s:gitsign_refresh'))
lua vim.defer_fn(require'gitsigns'.refresh, 150)
