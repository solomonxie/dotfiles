-- REF: https://wezfurlong.org/wezterm/config/files.html

local wezterm = require('wezterm');
local utf8 = require('utf8');

-- Version: 20220408
return {
    -- SCHEME: https://wezfurlong.org/wezterm/colorschemes
    -- SCHEME: https://github.com/mbadolato/iTerm2-Color-Schemes
    -- Argonaut | Ayu
    color_scheme = "Ayu",

    -- FONT
    font = wezterm.font("Droid Sans Mono for Powerline", {weight="Bold"}),
    -- font = wezterm.font("JetBrains Mono"),
    font_size = 15.0,  -- 15 for coding, 20 for CLI

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
    colors = {
        tab_bar = {
            background = "#262626",
            active_tab = {
                bg_color = "#202020",
                fg_color = "#808080",
            },
            inactive_tab = {
                bg_color = "#404040",
                fg_color = "#c0c0c0",
            },
            inactive_tab_hover = {
                bg_color = "#363636",
                fg_color = "#909090",
            },
        },
    },
    tab_bar_style = {
        active_tab_left = wezterm.format({
            {Background={Color="#0b0022"}},
            {Foreground={Color="#2b2042"}},
            {Text=utf8.char(0xe0b2)},
        }),
        active_tab_right = wezterm.format({
            {Background={Color="#0b0022"}},
            {Foreground={Color="#2b2042"}},
            {Text=utf8.char(0xe0b0)},
        }),
        inactive_tab_left = wezterm.format({
            {Background={Color="#0b0022"}},
            {Foreground={Color="#1b1032"}},
            {Text=utf8.char(0xe0b2)},
        }),
        inactive_tab_right = wezterm.format({
            {Background={Color="#0b0022"}},
            {Foreground={Color="#1b1032"}},
            {Text=utf8.char(0xe0b0)},
        }),
    },
}
