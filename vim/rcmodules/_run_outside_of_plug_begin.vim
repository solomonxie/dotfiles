
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
    vim.lsp.set_log_level("debug")

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
      local opts = { noremap=true, silent=true }
    end

    -- Use a loop to conveniently call 'setup' on multiple servers and
    -- map buffer local keybindings when the language server attaches
    local nvim_lsp = require('lspconfig')

    nvim_lsp['tsserver'].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }

    nvim_lsp['bashls'].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }

    nvim_lsp["pylsp"].setup{
       on_attach=on_attach,
       settings = {
           pylsp = {
               cmd = {"pylsp"},
               filetypes = {"python"},
               configurationSources = { "flake8" },
               plugins = {
                   -- flake8 =  { enabled = true },
                   -- pycodestyle =  { enabled = false },
                   pylint =  { enabled = true },
                   -- pyflakes =  { enabled = true }
               }
           }
       }
    }

    -- $ npm install -g vim-language-server
    -- $ npm i -g bash-language-server
    -- $ npm install -g typescript typescript-language-server
    -- $ pip install python-lsp-server
    nvim_lsp["vimls"].setup{
        on_attach=on_attach,
        settings = {
            vimls = {
                cmd = {"vim-language-server", "--stdio"},
                filetypes = {"vim"},
                init_options = {
                    diagnostic = {enable = true},
                    indexes = {
                        count = 3,
                        gap = 100,
                        projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
                        runtimepath = true
                    },
                    iskeyword = "@,48-57,_,192-255,-#",
                    runtimepath = "",
                    suggest = {
                        fromRuntimepath = true,
                        fromVimruntime = true
                    },
                    vimruntime = ""
                }
            }
        }
    }

EOF
endif



if &runtimepath =~ 'which-key'
lua << EOF
  require("which-key").setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}
EOF
endif
