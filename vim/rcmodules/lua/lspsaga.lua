if string.find(vim.o['runtimepath'], 'lspsaga')  then
    require('lspsaga').init_lsp_saga()
end
