local wezterm = require("wezterm")
local gon = require("utils.get_os_name")

---@class SystemConfig
---@field fontSize integer
---@field shell table
---@field env table|nil
local SystemConfig = {}

local osName, archName = gon.get_os_name()

---@type SystemConfig
local sysConf
if "Linux" == osName then
	sysConf = require("platforms.linux")
else
	sysConf = require("platforms.macos")
end

---@class Platforms
local M = {
	fontSize = sysConf.fontSize,
	shell = sysConf.shell,
	env = sysConf.env
}

return M