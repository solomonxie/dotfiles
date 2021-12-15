-- AVAILABLE LANGUAGE SERVERS (LSP):
-- REF: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local nvim_lsp = require('lspconfig')

-- vim.lsp.set_log_level("debug")
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap=true, silent=true }
    -- if string.find(vim.o['runtimepath'], 'lsp_compl') then
    --     require('lsp_compl').attach(client, bufnr, { server_side_fuzzy_completion = true })
    -- end
end

-- REF: https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
-- $ pip install python-lsp-server
-- $ pip install pycodestyle
nvim_lsp["pylsp"].setup{
    on_attach=on_attach,
    settings = {
        pylsp = {
            cmd = {"pylsp"},
            filetypes = {"python"},
            init_options = {
                lint = true,
            },
            single_file_support = true,
            -- configurationSources = {"flake8"},  -- CONFLICT WITH pylsp.plugins.flake8.config
            log_file = '/tmp/pylsp.log',
            plugins = {
                flake8 =  {enabled = true, config = vim.fn.expand("~/.config/flake8")},
                pylsp_mypy =  { enabled = true },
                -- pycodestyle =  { enabled = true },
                -- pylint =  { enabled = true },
                -- pyflakes =  { enabled = true }
            }
        }
    }
}

-- -- REF: https://github.com/microsoft/pyright
-- -- REF: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
-- -- $ npm -g install pyright
-- nvim_lsp["pyright"].setup{
--     on_attach=on_attach,
--     cmd = {"pyright-python-langserver", "--stdio"},
--     filetypes = {"python"},
--     single_file_support = true,
--     -- root_dir = function(startpath)
--     --     return M.search_ancestors(startpath, matcher)
--     -- end,
--     settings = {
--       python = {
--         analysis = {
--           disableOrganizeImports = true,
--           disableLanguageServices = false,
--           autoSearchPaths = true,
--           autoImportCompletions = true,
--           autoSearchPaths = true,
--           typeCheckingMode = "off",  -- off|basic|strict
--           diagnosticMode = "workspace",  -- workspace | openFilesOnly
--           useLibraryCodeForTypes = true,
--         }
--       }
--     }
-- }

-- REF: https://github.com/pappasam/jedi-language-server
-- REF: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jedi_language_server
-- $ pip install jedi-language-server
nvim_lsp["jedi_language_server"].setup{
    on_attach=on_attach,
    cmd = {"jedi-language-server"},
    filetypes = {"python"},
    single_file_support = true,
    jediSettings = {
        caseInsensitiveCompletion = true,
    },
}

-- -- $ npm install -g vim-language-server
-- -- $ npm i -g bash-language-server
-- -- $ npm install -g typescript typescript-language-server
-- -- $ pip install python-lsp-server
-- nvim_lsp["vimls"].setup{
--     on_attach=on_attach,
--     settings = {
--         vimls = {
--             cmd = {"vim-language-server", "--stdio"},
--             filetypes = {"vim"},
--             init_options = {
--                 diagnostic = {enable = true},
--                 indexes = {
--                     count = 3,
--                     gap = 100,
--                     projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
--                     runtimepath = true
--                 },
--                 iskeyword = "@,48-57,_,192-255,-#",
--                 runtimepath = "",
--                 suggest = {
--                     fromRuntimepath = true,
--                     fromVimruntime = true
--                 },
--                 vimruntime = ""
--             }
--         }
--     }
-- }
