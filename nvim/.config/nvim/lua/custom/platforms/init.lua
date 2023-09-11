local gon = require("custom.utils.get_os_name")

---@class SystemConfig
---@field font string
local SystemConfig = {}

local osName, archName = gon.get_os_name()

---@type SystemConfig
local sysConf
if "Linux" == osName then
	sysConf = require("custom.platforms.linux")
else
	sysConf = require("custom.platforms.macos")
end

---@class Platforms
local M = {
	font = sysConf.font
}

return M