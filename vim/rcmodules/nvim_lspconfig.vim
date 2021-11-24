" REF: https://github.com/neovim/nvim-lspconfig
Plug 'neovim/nvim-lspconfig'

" AVAILABLE LANGUAGE SERVERS:
" REF: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

" PREREQUISITE:
" INSTALLATION:
" pip install neovim
" pip install python-language-server
" pip install python-lsp-server
" npm install -g neovim
" npm install -g vim-language-server
" npm install -g typescript typescript-language-server
" npm -i -g bash-language-server

" =====> more settings in =========>
" ./vim/rcmodules/_run_outside_of_plug_begin.vim

nnoremap <Leader>d :lua vim.lsp.buf.definition()<CR>
nnoremap <Leader>r :lua vim.lsp.buf.rename()<CR>
nnoremap <Leader>u :lua vim.lsp.buf.references()<CR>
nnoremap <C-p> :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <C-n> :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <Leader>a :lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <Leader>x :lua vim.lsp.buf.formatting()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>

" -- See `:help vim.lsp.*` for documentation on any of the below functions
