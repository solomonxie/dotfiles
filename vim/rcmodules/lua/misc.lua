--{HOP}
--REF: https://github.com/phaazon/hop.nvim
if string.find(vim.o['runtimepath'], 'hop') then
    require'hop'.setup()
end
