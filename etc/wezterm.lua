-- REF: https://wezfurlong.org/wezterm/config/files.html

local wezterm = require('wezterm');

-- The filled in variant of the > and < symbols
local utf8 = require('utf8');
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

-- Version: 20220408
return {
    -- SCHEME: https://wezfurlong.org/wezterm/colorschemes
    -- SCHEME: https://github.com/mbadolato/iTerm2-Color-Schemes
    -- Argonaut | Ayu
    color_scheme = "Argonaut",

    -- FONT
    font = wezterm.font("Fira Code", {weight="Medium"}),
    -- font = wezterm.font("JetBrains Mono"),
    font_size = 14.0,  -- 15 for coding, 20 for CLI

    -- GENERAL
    automatically_reload_config = true,
    set_environment_variables = {
        WEZTERM_CONFIG_FILE = "~/.config/wezterm/wezterm.lua",
    },
    keys = {
        {key="w", mods="CMD", action="DisableDefaultAssignment"},
        {key="f", mods="CMD", action=wezterm.action{Search={CaseInSensitiveString="hash"}}},
    },

    -- WINDOW
    initial_cols = 130,
    initial_rows = 40,
    enable_scroll_bar = false,
    window_padding = {left = 0, right = 0, top = 0, bottom = 0},

    -- TAB
    tab_bar_at_bottom = true,
    tab_max_width = 32,
    tab_bar_style = {
        active_tab_left = wezterm.format {
            { Background = { Color = '#0b0022' } },
            { Foreground = { Color = '#2b2042' } },
            { Text = SOLID_LEFT_ARROW },
        },
        active_tab_right = wezterm.format {
            { Background = { Color = '#0b0022' } },
            { Foreground = { Color = '#2b2042' } },
            { Text = SOLID_RIGHT_ARROW },
        },
        inactive_tab_left = wezterm.format {
            { Background = { Color = '#0b0022' } },
            { Foreground = { Color = '#1b1032' } },
            { Text = SOLID_LEFT_ARROW },
        },
        inactive_tab_right = wezterm.format {
            { Background = { Color = '#0b0022' } },
            { Foreground = { Color = '#1b1032' } },
            { Text = SOLID_RIGHT_ARROW },
        },
    },

    -- COLORS
    colors = {
        -- tab_bar = {},
    },
}
