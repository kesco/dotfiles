local wezterm = require("wezterm")
local sys = require("utils.sys")

---@class SystemConfig
---@field fontSize integer
---@field shell table
---@field env table|nil
---@field Init function|nil
local SystemConfig = {}

local osName, archName = sys:GetOSInfo()

---@type SystemConfig
local sysConf
if "Linux" == osName then
	sysConf = require("platforms.linux")
else
	sysConf = require("platforms.macos")
	sysConf:Init(archName)
end

---@class Platforms
local M = {
	fontSize = sysConf.fontSize,
	shell = sysConf.shell,
	env = sysConf.env
}

return M