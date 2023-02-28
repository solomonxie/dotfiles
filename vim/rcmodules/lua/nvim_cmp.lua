--REF: https://github.com/hrsh7th/nvim-cmp
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
                -- { name = 'dictionary', keyword_length=2, },
            },
            {
                -- { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'cmdline' },
                { name = 'treesitter' },
            },
            {
                { name = "omni" },  -- Slow
                { name = "spell" },
            }
        ),
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            -- ['<C-p>'] = cmp.select_prev_item(),
            -- ['<C-n>'] = cmp.select_next_item(),
            ['<C-e>'] = cmp.mapping.abort(),
            -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
    })
    -- Settings for <cmp-spell>
    vim.opt.spell = true
    vim.opt.spelllang = { 'en_us' }

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
        -- "Works only for neovim 0.7+ -->
        -- mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' },
            { name = 'path' },
            { name = 'cmdline' },
        }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        -- "Works only for neovim 0.7+ -->
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
            {
                { name = 'path' },
            },
            {
                -- { name = 'buffer' },
                { name = 'cmdline' },
            }
        )
    })
    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    -- lspc['pylsp'].setup { capabilities = capabilities }
    -- lspc['jedi_language_server'].setup { capabilities = capabilities }
    lspc['vimls'].setup { capabilities = capabilities }
    lspc['tsserver'].setup { capabilities = capabilities }

    -- Dictionary
    require("cmp_dictionary").setup({
        dic = {
            ["*"] = { "/usr/share/dict/words" },
            -- ["lua"] = "path/to/lua.dic",
            -- ["javascript,typescript"] = { "path/to/js.dic", "path/to/js2.dic" },
            -- filename = {
            --     ["xmake.lua"] = { "path/to/xmake.dic", "path/to/lua.dic" },
            -- },
            -- filepath = {
            --     ["%.tmux.*%.conf"] = "path/to/tmux.dic"
            -- },
            -- spelllang = {
            --     en = "path/to/english.dic",
            -- },
        },
        -- The following are default values.
        exact = 2,
        first_case_insensitive = false,
        document = false,
        document_command = "wn %s -over",
        async = false,
        max_items = -1,
        capacity = 5,
        debug = false,
    })
end
