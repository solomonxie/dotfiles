" REF: https://github.com/neovim/nvim-lspconfig
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/plenary.nvim'  "Func Dependencies for many Lua plugins

" AVAILABLE LANGUAGE SERVERS:
" REF: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

" PREREQUISITE:
" INSTALLATION:
" pip install neovim
" pip install python-language-server
" pip install python-lsp-server
" npm install -g neovim
" npm install -g vim-language-server
" npm install -g typescript typescript-language-server
" npm install -g bash-language-server

" nnoremap <Leader>d :lua vim.lsp.buf.definition()<CR>
" nnoremap <Leader>r :lua vim.lsp.buf.rename('')<LEFT><LEFT>
" vnoremap <Leader>r :lua vim.lsp.buf.rename('')<LEFT><LEFT>
" nnoremap <Leader>u :lua vim.lsp.buf.references()<CR>
" nnoremap <C-p> :lua vim.diagnostic.goto_prev()<CR>
" nnoremap <C-n> :lua vim.diagnostic.goto_next()<CR>
" nnoremap <Leader>a :lua vim.diagnostic.set_loclist()<CR>
" nnoremap <Leader>x :lua vim.lsp.buf.formatting()<CR>
" nnoremap K :lua vim.lsp.buf.hover()<CR>


" RUN AFTER ALL PLUGINS ARE LOADED:
" augroup LoadLspClients  "SLOW!!! COLD START!!!
"     autocmd!
"     autocmd VimEnter * luafile ~/myconf/dotfiles/vim/rcmodules/lua/misc.lua
"     autocmd VimEnter * luafile ~/myconf/dotfiles/vim/rcmodules/lua/lsp-python.lua
"     autocmd VimEnter * luafile ~/myconf/dotfiles/vim/rcmodules/lua/lsp-lua.lua
"     autocmd VimEnter * luafile ~/myconf/dotfiles/vim/rcmodules/lua/gitsigns.lua
"     autocmd VimEnter * luafile ~/myconf/dotfiles/vim/rcmodules/lua/lsp-installer.lua
"     autocmd VimEnter * luafile ~/myconf/dotfiles/vim/rcmodules/lua/cmp.lua
"     autocmd VimEnter * luafile ~/myconf/dotfiles/vim/rcmodules/lua/lspsaga.lua
"     autocmd VimEnter * luafile ~/myconf/dotfiles/vim/rcmodules/lua/treesitter.lua
"     autocmd VimEnter * luafile ~/myconf/dotfiles/vim/rcmodules/lua/whichkey.lua
"     autocmd VimEnter * luafile ~/myconf/dotfiles/vim/rcmodules/lua/blankline.lua

"     " autocmd VimEnter * luafile ~/myconf/dotfiles/vim/rcmodules/lua/lsp-sql.lua
"     " autocmd VimEnter * luafile ~/myconf/dotfiles/vim/rcmodules/lua/lsp-vim.lua
"     " autocmd VimEnter * luafile ~/myconf/dotfiles/vim/rcmodules/lua/lsp-js.lua
"     " autocmd VimEnter * luafile ~/myconf/dotfiles/vim/rcmodules/lua/schedule.lua
" augroup end


" -- See `:help vim.lsp.*` for documentation on any of the below functions

" =====> more settings in =========>
" ./vim/rcmodules/lua/*.lua
