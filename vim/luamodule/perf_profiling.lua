-- TIPS:
-- - :StartupTime ~/foo.vim 100
-- - :StartupTime 100 -- -u ~/foo.vim -i NONE -- ~/foo.vim
-- - $ time vim +q
-- - $ vim +StartupTime
-- - $ vim --startuptime startup.txt startup.txt
-- - $ vim -D  # Step debugging mode

--REF: https://reposhub.com/python/miscellaneous/lewis6991-impatient-nvim.html  --Speed up Lua--
--REF: https://codeinthehole.com/tips/debugging-vim-by-example/#why-is-vim-slow-to-start-up


-- REF: https://github.com/tweekmonster/startuptime.vim
use 'tweekmonster/startuptime.vim'   --VIM loading analysis


--REF: https://github.com/lewis6991/impatient.nvim
--Optimize Lua module loading time
-- Plug 'lewis6991/impatient.nvim'


--REF: https://thoughtbot.com/blog/profiling-vim
-- :profile start profile.log
-- :profile func *
-- :profile file *
-- -- At this point do slow actions
-- :profile pause
-- :noautocmd qall!

vim.cmd('profile start /tmp/vim_profile.log')
vim.cmd('profile func *')
vim.cmd('profile file *')

-- PUT THESE LINES AT THE BOTTOM OF VIMRC
-- :profile pause
-- :noautocmd qall!
