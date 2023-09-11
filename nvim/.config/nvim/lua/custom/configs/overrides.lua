local M = {}

M.treesitter = {
	ensure_installed = {
		"c",
		"cmake",
		"cpp",
		"css",
		"dart",
		"dockerfile",
		"fish",
		"git_config",
		"gitignore",
		"go",
		"html",
		"ini",
		"java",
		"javascript",
		"json",
		"kdl",
		"kotlin",
		"lua",
		"markdown",
		"markdown_inline",
		"rust",
		"smali",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"zig",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		"bash-language-server",
		"clangd",
		"css-lsp",
		"deno",
		"html-lsp",
		"json-lsp",
		"prettier",
		"lua-language-server",
		"marksman",
		"neocmakelsp",
		"stylua",
		"typescript-language-server",
		"zls",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
