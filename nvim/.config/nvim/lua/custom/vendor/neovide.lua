local platforms = require("custom.platforms")

local M = {}

function M:Setup()
	vim.opt.guifont = platforms.font
end

return M
