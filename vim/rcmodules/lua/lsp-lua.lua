local lspc = require('lspconfig')

local on_attach = function(_, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end


-- REF: https://github.com/sumneko/lua-language-server
-- $ brew install lua-language-server
-- :LspInstall sumneko_lua
lspc["sumneko_lua"].setup{
    on_attach=on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                -- path = runtime_path,
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    }
}
