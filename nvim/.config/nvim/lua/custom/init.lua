-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- 判断是否使用Neovide GUI，设置GUI字体
if vim.g.neovide then
  vim.o.guifont = "Sarasa Mono SC Nerd Font:h12"
end

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
