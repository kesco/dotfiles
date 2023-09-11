local platforms = require("custom.platforms")

local M = {}

function M:Setup()
	vim.o.guifont = platforms.font
end

return M
