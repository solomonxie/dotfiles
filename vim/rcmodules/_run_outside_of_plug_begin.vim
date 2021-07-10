
if &runtimepath =~ 'deoplete'
    " REF (Bug): https://github.com/carlitux/deoplete-ternjs/issues/88#issuecomment-713913170
    call deoplete#custom#option('num_processes', 4)
endif



if &runtimepath =~ 'treesitter'
lua <<EOF
    require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
        highlight = {
        enable = true,              -- false will disable the whole extension
        -- disable = { "c", "rust" },  -- list of language that will be disabled
    },
}
EOF
endif


if &runtimepath =~ 'nvim-lspconfig'
lua << EOF
    local nvim_lsp = require('lspconfig')
    vim.lsp.set_log_level("debug")

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      --Enable completion triggered by <c-x><c-o>
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { noremap=true, silent=true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
      buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    end

    -- Use a loop to conveniently call 'setup' on multiple servers and
    -- map buffer local keybindings when the language server attaches
    local servers = {"pyls", "tsserver"}
    for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        }
      }
    end

    require('lspconfig').pyls.setup{
        on_attach=on_attach_vim,
        settings = {
            pyls = {
                plugins = {
                    pycodestyle =  { enabled = false },
                    pylint =  { enabled = false }
                }
            }
        }
    }
EOF
endif
