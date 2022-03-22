local lspc = require('lspconfig')
local cmp = require('cmp')
if not lspc or not cmp then return nil end

-- SUPPORTED SOURCES: https://github.com/topics/nvim-cmp
if string.find(vim.o['runtimepath'], 'cmp')  then
    -- Setup nvim-cmp.
    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end,
        },
        sources = cmp.config.sources(
            {
                { name = 'nvim_lsp' },
                { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'vsnip' }, -- For vsnip users.
                -- { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'snippy' }, -- For snippy users.
                { name = 'buffer' },
            },
            {
                -- { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'commandline' },
                { name = 'treesitter' },
            }
        )
        -- mapping = {
        --     ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        --     ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        --     ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        --     ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        --     ['<C-e>'] = cmp.mapping({
        --         i = cmp.mapping.abort(),
        --         c = cmp.mapping.close(),
        --     }),
        --     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- },
    })
    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
        sources = {
            { name = 'buffer' }
        }
    })
    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })
    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    -- lspc['pylsp'].setup { capabilities = capabilities }
    -- lspc['jedi_language_server'].setup { capabilities = capabilities }
    lspc['vimls'].setup { capabilities = capabilities }
    lspc['tsserver'].setup { capabilities = capabilities }
end
