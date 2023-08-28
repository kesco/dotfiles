local wezterm = require("wezterm")

local function chooseTerminalTheme(appearance)
	if appearance:find("Dark") then
		return "Tokyo Night (Gogh)"
	else
		return "Tokyo Night Light (Gogh)"
	end
end

local config = wezterm.config_builder()
-- 设置检查模式为严格
config:set_strict_mode(true)

-- Tab设置
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- 字体设置
config.font = wezterm.font("Sarasa Mono SC Nerd Font")
config.font_size = 12

-- 主题设置
config.color_scheme = chooseTerminalTheme(wezterm.gui.get_appearance())

-- 其它设置
config.default_prog = { "/usr/bin/fish", "-i" }

return config
