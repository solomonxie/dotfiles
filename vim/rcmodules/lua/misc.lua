--{HOP}
--REF: https://github.com/phaazon/hop.nvim
if string.find(vim.o['runtimepath'], 'hop') then
    require('hop').setup()
end

if string.find(vim.o['runtimepath'], 'project') then
    require("project_nvim").setup {
        manual_mode = false,
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git" },
        ignore_lsp = {},
        exclude_dirs = {},
        show_hidden = false,
        silent_chdir = false,
        datapath = vim.fn.stdpath("data"),
    }
end
