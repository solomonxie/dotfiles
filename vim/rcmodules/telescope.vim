"https://github.com/nvim-telescope/telescope.nvim
" SUPER SLOOOOOOOOW!

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

nnoremap T :Telescope <C-d>
nnoremap <C-f> :Telescope find_files<CR>
nnoremap <leader>gf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>gg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>gt <cmd>lua require('telescope.builtin').help_tags()<cr>
