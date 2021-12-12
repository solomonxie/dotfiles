local servers = require('nvim-lsp-installer.servers')
local server_available, requested_server = servers.get_server("jedi_language_server")
if server_available then
    requested_server:on_ready(function ()
        local opts = {}
        requested_server:setup(opts)
    end)
    if not requested_server:is_installed() then
        -- Queue the server to be installed
        requested_server:install()
    end
end

