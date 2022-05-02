-- REF: https://wezfurlong.org/wezterm/config/files.html

local wezterm = require('wezterm');

-- Version: 20220408
return {
    -- SCHEME: https://wezfurlong.org/wezterm/colorschemes
    -- SCHEME: https://github.com/mbadolato/iTerm2-Color-Schemes
    -- Argonaut | Ayu | Blue Matrix
    color_scheme = "Ayu",

    -- FONT
    font = wezterm.font("Droid Sans Mono for Powerline"),
    -- font = wezterm.font("JetBrains Mono"),
    font_size = 17.0,  -- 16 for coding, 20 for CLI

    -- GENERAL
    automatically_reload_config = true,
    set_environment_variables = {
        WEZTERM_CONFIG_FILE = "~/.config/wezterm/wezterm.lua",
    },
    keys = {
        -- {key="w", mods="CMD", action="DisableDefaultAssignment"},
        -- {key="f", mods="CMD", action=action=wezterm.action{Search={CaseInSensitiveString="hash"}}},
    },

    -- WINDOW
    initial_cols = 130,
    initial_rows = 40,

    -- TAB
    tab_bar_at_bottom = true,
    tab_max_width = 32,
    colors = {
        tab_bar = {
            background = "#262626",
            active_tab = {
                bg_color = "#404040",
                fg_color = "#c0c0c0",
                intensity = "Bold",
                underline = "None",
                italic = false,
                strikethrough = false,
            },
            inactive_tab = {
                bg_color = "#202020",
                fg_color = "#808080",
            },
            inactive_tab_hover = {
                bg_color = "#363636",
                fg_color = "#909090",
                italic = false,
            },
        },
    },
}
