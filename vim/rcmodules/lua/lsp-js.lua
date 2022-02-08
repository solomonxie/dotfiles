local lspc = require('lspconfig')

local on_attach = function(_, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end


-- $ npm install -g typescript typescript-language-server
lspc["tsserver"].setup{
    on_attach=on_attach,
    settings = {
        tsserver = {
            cmd = { "typescript-language-server", "--stdio" },
            filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
            init_options = {
                hostInfo = "neovim"
            },
            -- root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
        }
    }
}
