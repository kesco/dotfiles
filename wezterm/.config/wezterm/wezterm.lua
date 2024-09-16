local wezterm = require("wezterm")
local platforms = require("platforms")

local function chooseTerminalTheme(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Frappé (Gogh)"
	else
		return "Catppuccin Latte (Gogh)"
	end
end

local config = wezterm.config_builder()
-- 设置检查模式为严格
config:set_strict_mode(true)

-- Tab设置
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- 字体设置
config.font = wezterm.font("Sarasa Mono SC Nerd Font")
config.font_size = platforms.fontSize

-- 主题设置
config.color_scheme = chooseTerminalTheme(wezterm.gui.get_appearance())

-- 其它设置
config.default_prog = platforms.shell
if platforms.env then
	config.set_environment_variables = platforms.env
end

return config
