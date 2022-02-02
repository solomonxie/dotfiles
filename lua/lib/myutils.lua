-- ADD THIS ENV TO BASHRC/ZSHRC:
--  export LUA_PATH="$HOME/myconf/dotfiles/lua/lib/?.lua;$LUA_PATH"
local M = {}

function M.enumerate (tb)
    local i = 0
    return function ()
        i = i + 1
        if i <= #tb then return i, tb[i] end
    end
end


function M.enumerate_line(content)
    local i = 0
    return function ()
        i = i + 1
        local pos = string.find(content, '\n')
        if not pos then pos = 1 end
        local line = string.sub(content, 1, pos - 1)
        line = string.gsub(string.gsub(line, '^%s+', ''), '%s+$', '')
        if string.len(line) > 0 and pos <= #content then
            content = string.sub(content, pos + 1)
            return i, line
        end
    end
end

return M
