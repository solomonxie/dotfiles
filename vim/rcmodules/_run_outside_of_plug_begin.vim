
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

    end

    -- Use a loop to conveniently call 'setup' on multiple servers and
    -- map buffer local keybindings when the language server attaches
    local servers = {"pyls", "tsserver", "bashls", "vimls"}
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
                    pylint =  { enabled = false },
                    flake8 =  { enabled = true }
                }
            }
        }
    }
EOF
endif
