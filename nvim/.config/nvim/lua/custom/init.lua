-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local vendor = require("custom.vendor")

vendor:Setup()

-- 设置KDL文件格式识别
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = {"*.kdl"},
  callback = function(_)
		vim.bo.filetype = "kdl"
  end
})

-- 使用系统剪贴板
vim.opt.clipboard = "unnamedplus"

-- 使用相对行号
vim.opt.relativenumber = true
