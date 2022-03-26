function LspRename()
    -- REF: https://hastebin.skyra.pw/butoxuwaci.pgsql
    local curr_name = vim.fn.expand("<cword>")
    local value = vim.fn.input("LSP Rename: ", curr_name)
    local lsp_params = vim.lsp.util.make_position_params()

    if not value or #value == 0 or curr_name == value then return end

    -- request lsp rename
    lsp_params.newName = value
    vim.lsp.buf_request(0, "textDocument/rename", lsp_params, function(_, res, ctx, _)
        if not res then return end

        -- apply renames
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        vim.lsp.util.apply_workspace_edit(res, client.offset_encoding)

        -- print renames
        local changed_files_count = 0
        local changed_instances_count = 0

        if (res.documentChanges) then
            for _, changed_file in pairs(res.documentChanges) do
                changed_files_count = changed_files_count + 1
                changed_instances_count = changed_instances_count + #changed_file.edits
            end
        elseif (res.changes) then
            for _, changed_file in pairs(res.changes) do
                changed_instances_count = changed_instances_count + #changed_file
                changed_files_count = changed_files_count + 1
            end
        end

        -- compose the right print message
        print(string.format("renamed %s instance%s in %s file%s. %s",
        changed_instances_count,
        changed_instances_count == 1 and '' or 's',
        changed_files_count,
        changed_files_count == 1 and '' or 's',
        changed_files_count > 1 and "To save them run ':wa'" or ''
        ))
    end)
end
