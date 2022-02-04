M = {}

function M.parse_csv_line(line, sep)
    if not line then return nil end
    if not sep then sep = ',' end
    local values = {}
    -- FIND THE COLUMN VALUE'S END-POSITION
    local pos = string.find(line, sep)
    if string.sub(line, 1, 1) == '[' then
        -- DTYPE: ARRAY
        local arr_end_pos = string.find(line, ']')
        if arr_end_pos then pos = arr_end_pos + 1 end
    end
    if not pos then pos = string.len(line) + 1 end
    local v = string.sub(line, 1, pos - 1)  -- GET COLUMN VALUE
    v = string.gsub(string.gsub(v, '^%s+', ''), '%s+$', '')  -- TRIM SPACES
    if string.sub(v, 1, 1) == '"' and string.sub(v, #v, #v) == '"' then
        v = string.sub(v, 2, #v - 1)
    end
    if string.sub(v, 1, 1) == '\'' and string.sub(v, #v, #v) == '\'' then
        v = string.sub(v, 2, #v - 1)
    end
    if v and string.len(v) > 0 then
        -- print('found value: ' .. v)
        table.insert(values, v)
    end
    local more = string.sub(line, pos + 1)
    if #more > 0 then
        local next_values = M.parse_csv_line(more)
        if next_values and #next_values > 0 then
            for i = 1, #next_values do
                table.insert(values, next_values[i])
            end
        end
    end
    return values
end


function M.parse_file(path, sep)
    print('LODING CONTENT...')
    if not sep then sep = ',' end
    -- PARSE LINES
    local rows = {}
    for line in io.lines(path) do
        local vlist = M.parse_csv_line(line, sep)
        if vlist and #vlist > 0 then table.insert(rows, vlist) end
    end

    -- CONVERT TO DICT ROWS
    local tb, headers = {}, {}
    if rows and #rows > 1 then headers = table.remove(rows, 1) end
    for i = 1, #rows do
        local d = {}
        for j, v in pairs(headers) do
            d[v] = rows[i][j]
        end
        if d and #d then table.insert(tb, d) end
    end
    print('DONE: LOADED CSV CONTENT...')
    return tb
end


function M.parse_file_by_line(path, sep)
    print('LODING CONTENT...')
    if not sep then sep = ',' end
    local i = 0
    local iter = io.lines(path)
    local header_line = iter()
    local headers = M.parse_csv_line(header_line)
    return function ()
        i = i + 1
        if i == 1 then return i, header_line, headers end
        local line = iter()
        local vlist = M.parse_csv_line(line) or {}
        if vlist and #vlist > 0 then
            local d = {}
            for j, col in pairs(headers) do
                d[col] = vlist[j]
            end
            return i, line, d
        else
            print('DONE: LOADED CSV CONTENT...')
        end
    end
end

return M
