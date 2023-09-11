local M = {}

function M:Setup()
	if vim.g.neovide then
		local neovide = require("custom.vendor.neovide")
		neovide:Setup()
	end
end

return M
