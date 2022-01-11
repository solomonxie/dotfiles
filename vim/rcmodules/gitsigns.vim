"REF: https://github.com/lewis6991/gitsigns.nvim

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

nnoremap gn :Gitsigns next_hunk<CR>
nnoremap gp :Gitsigns prev_hunk<CR>
nnoremap gP :Gitsigns preview_hunk<CR>
nnoremap gb :Gitsigns blame_line<CR>
nnoremap gS :Gitsigns refresh<CR>
nnoremap <Leader>b :Gitsigns toggle_current_line_blame<CR>
