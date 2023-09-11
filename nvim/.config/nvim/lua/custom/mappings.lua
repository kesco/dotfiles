---@type MappingsTable
local M = {}

M.disabled = {
	n = {
		["<leader>b"] = "",
		["<leader>f"] = "",
		["<leader>fb"] = "",
		["<C-n>"] = "",
		["<tab>"] = "",
		["<S-tab>"] = "",
	},
}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>bb"] = { "<cmd> enew <CR>", "new buffer" },
		["[q"] = { "<cmd> cprev <CR> zz", "previous quickFix" },
		["]q"] = { "<cmd> cnext <CR> zz", "next quickFix" },
	},
}

M.nvimtree = {
	n = {
		["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
	},
}

M.tabufline = {
	n = {
		["<S-l>"] = {
			function()
				require("nvchad.tabufline").tabuflineNext()
			end,
			"Goto next buffer",
		},
		["<S-h>"] = {
			function()
				require("nvchad.tabufline").tabuflinePrev()
			end,
			"Goto prev buffer",
		},
	},
}

M.telescope = {
	n = {
		["<leader>bl"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
		["<leader>ss"] = { "<cmd> Telescope lsp_document_symbols <CR>", "document symbols" },
		["<leader>sd"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "workspace symbols" },
		["<leader>ld"] = { "<cmd> Telescope diagnostics <CR>", "workspace diagnostics" },
	},
}

return M
