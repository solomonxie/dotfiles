-- REF: https://wezfurlong.org/wezterm/config/files.html

local wezterm = require('wezterm');

local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

return {
    -- color_scheme = "Batman",
    -- font = wezterm.font("Droid Sans Mono for Powerline"),
    -- default_prog = {"/bin/zsh", "-l"},
    tab_bar_at_bottom = true,
    enable_scroll_bar = true,
    font = wezterm.font("JetBrains Mono"),
    font_size = 14.0,
    text_blink_rate = 500

    set_environment_variables = {
        WEZTERM_CONFIG_FILE = "~/.config/wezterm/wezterm.lua"
    },

    keys = {
        {key="w", mods="CMD", action="DisableDefaultAssignment"},
    },

    tab_max_width = 32,
    tab_bar_style = {
        new_tab = wezterm.format({
            {Background={Color="#0b0022"}},
            {Foreground={Color="#2b2042"}},
            {Text=SOLID_LEFT_ARROW},
        }),
        new_tab_hover = wezterm.format({
            {Background={Color="#0b0022"}},
            {Foreground={Color="#2b2042"}},
            {Text=SOLID_RIGHT_ARROW},
        }),
        -- inactive_tab_left = wezterm.format({
        --     {Background={Color="#0b0022"}},
        --     {Foreground={Color="#1b1032"}},
        --     {Text=SOLID_LEFT_ARROW},
        -- }),
        -- inactive_tab_right = wezterm.format({
        --     {Background={Color="#0b0022"}},
        --     {Foreground={Color="#1b1032"}},
        --     {Text=SOLID_RIGHT_ARROW},
        -- }),
    },
}
