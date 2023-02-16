local lspc = require('lspconfig')
if not lspc then return nil end

local on_attach_general = function(_, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- REF: https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
-- $ pip install python-lsp-server
-- $ pip install pycodestyle
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspc["pylsp"].setup{
    on_attach=on_attach_general,
    capabilities=capabilities,
    settings = {
        pylsp = {
            cmd = { "pylsp" },
            filetypes = {"python"},
            init_options = { lint = false },
            debounce = 100,
            single_file_support = true,
            configurationSources = { "flake8" },  -- CONFLICT WITH pylsp.plugins.flake8.config
            plugins = {
                jedi_completion = { include_params = true },
                -- flake8 = {enabled = true, config = vim.fn.expand("~/.config/flake8")},
                -- pylsp_mypy =  { enabled = true },
                -- pycodestyle =  { enabled = true },
                -- pylint =  { enabled = true },
                -- pyflakes =  { enabled = true }
            }
        }
    }
}

-- -- REF: https://github.com/sourcery-ai/sourcery
-- lspc["sourcery"].setup{
--     on_attach=on_attach_general,
-- }

-- -- REF: https://github.com/emanspeaks/pyls-flake8/
-- -- $ pip install pyls-flake8
-- lspc["pylsp-flake8"].setup{
--     on_attach=on_attach_general,
-- }

-- -- REF: https://github.com/pappasam/jedi-language-server
-- -- REF: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jedi_language_server
-- -- $ pip install jedi-language-server
-- lspc["jedi_language_server"].setup{
--     on_attach=on_attach_general,
--     cmd = {"jedi-language-server"},
--     filetypes = {"python"},
--     single_file_support = true,
--     jediSettings = {
--         caseInsensitiveCompletion = true,
--     },
-- }

-- lspc["pyright"].setup{
--     on_attach=on_attach_general,
--     cmd = { "pyright-langserver", "--stdio" },
--     filetypes = { "python" },
--     single_file_support = true,
--     settings = {
--         python = {
--             analysis = {
--                 autoSearchPaths = true,
--                 diagnosticMode = "workspace",
--                 useLibraryCodeForTypes = true
--             }
--         }
--     }
-- }

-- -- $ npm install -g diagnostic-languageserver
-- lspc.diagnosticls.setup {
--     filetypes = { "python" },
--     init_options = {
--         filetypes = {
--             python = {"flake8"},
--         },
--         linters = {
--             flake8 = {
--                 debounce = 100,
--                 sourceName = "flake8",
--                 command = "flake8",
--                 args = {
--                     "--config",
--                     "~/.config/flake8",
--                     "--format",
--                     "%(row)d:%(col)d:%(code)s:%(code)s: %(text)s",
--                     "%file",
--                 },
--                 formatPattern = {
--                     "^(\\d+):(\\d+):(\\w+):(\\w).+: (.*)$",
--                     {
--                         line = 1,
--                         column = 2,
--                         message = {"[", 3, "] ", 5},
--                         security = 4
--                     }
--                 },
--                 securities = {
--                     E = "error",
--                     W = "warning",
--                     F = "info",
--                     B = "hint",
--                 },
--             },
--         },
--     }
-- }

-- -- REF: https://github.com/microsoft/pyright
-- -- REF: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
-- -- $ npm -g install pyright
-- lspc["pyright"].setup{
--     on_attach=on_attach_general,
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
