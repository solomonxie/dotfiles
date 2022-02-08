-- AVAILABLE LANGUAGE SERVERS (LSP):
-- REF: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local lsp_set = {
    '~/myconf/dotfiles/vim/rcmodules/lua/lsp-python.lua',
    '~/myconf/dotfiles/vim/rcmodules/lua/lsp-lua.lua',
    -- '~/myconf/dotfiles/vim/rcmodules/lua/lsp-vim.lua',
    -- '~/myconf/dotfiles/vim/rcmodules/lua/lsp-js.lua',
}

if string.find(vim.o['runtimepath'], 'lspconfig')  then
    for _, path in pairs(lsp_set) do
        dofile(vim.fn.expand(path))
    end
end
