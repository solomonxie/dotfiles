--REF: https://github.com/lewis6991/gitsigns.nvim

if string.find(vim.o['runtimepath'], 'gitsigns')  then
    MOD = require('gitsigns')
    MOD.setup {
        signs = {
            add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
            change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
            delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
            topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
            changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        },
        base = 'HEAD',
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        keymaps = {
            -- Default keymap options
            -- noremap = true,
            -- ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
            -- ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},
            -- ['n <leader>hs'] = '<cmd>Gitsigns stage_hunk<CR>',
            -- ['v <leader>hs'] = ':Gitsigns stage_hunk<CR>',
            -- ['n <leader>hu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
            -- ['n <leader>hr'] = '<cmd>Gitsigns reset_hunk<CR>',
            -- ['v <leader>hr'] = ':Gitsigns reset_hunk<CR>',
            -- ['n <leader>hR'] = '<cmd>Gitsigns reset_buffer<CR>',
            -- ['n <leader>hp'] = '<cmd>Gitsigns preview_hunk<CR>',
            -- ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
            -- ['n <leader>hS'] = '<cmd>Gitsigns stage_buffer<CR>',
            -- ['n <leader>hU'] = '<cmd>Gitsigns reset_buffer_index<CR>',

            -- Text objects
            ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
            ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
        },
        watch_gitdir = {
            interval = 1000,
            follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 50,
            ignore_whitespace = false,
        },
        current_line_blame_formatter_opts = {
            relative_time = false
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 10000,
        preview_config = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
        yadm = {
            enable = false
        },
    }

    -- local refresh_rate = 5000  -- ms
    -- local function time_background()
    --     local timer = vim.loop.new_timer()
    --     timer:start(0, refresh_rate, vim.schedule_wrap(function()
    --         MOD.refresh()
    --         -- print(os.date('%S'))
    --         -- local hour = tonumber(os.date('%H'))
    --         -- local bg = (hour > 6 and hour < 18) and 'light' or 'dark'
    --         -- if vim.o.bg ~= bg then vim.o.bg = bg end
    --     end))
    -- end
    -- time_background()
end
