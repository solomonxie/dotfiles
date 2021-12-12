" TIPS:
" - :StartupTime ~/foo.vim 100
" - :StartupTime 100 -- -u ~/foo.vim -i NONE -- ~/foo.vim
" - $ time vim +q
" - $ vim +StartupTime
" - $ vim --startuptime startup.txt startup.txt
" - $ vim -D  # Step debugging mode

"REF: https://reposhub.com/python/miscellaneous/lewis6991-impatient-nvim.html  "Speed up Lua"
"REF: https://codeinthehole.com/tips/debugging-vim-by-example/#why-is-vim-slow-to-start-up


" REF: https://github.com/tweekmonster/startuptime.vim
Plug 'tweekmonster/startuptime.vim'   "VIM loading analysis


"REF: https://github.com/lewis6991/impatient.nvim
"Optimize Lua module loading time
" Plug 'lewis6991/impatient.nvim'
