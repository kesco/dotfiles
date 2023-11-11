local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local lspConfigUtil = require("lspconfig.util")

-- if you just want default config for the servers then put them in a table
local lspBatch = {
	"bashls",
	"cssls",
	"html",
	"neocmake",
	"tsserver",
}

-- Clangd特殊处理
local clangdCapabilities = vim.lsp.protocol.make_client_capabilities()
clangdCapabilities.offsetEncoding = "utf-8"
lspconfig["clangd"].setup({
	on_attach = on_attach,
	capabilities = clangdCapabilities,
})

-- Zls特殊处理
lspconfig["zls"].setup({
	root_dir = lspConfigUtil.root_pattern("zls.json", ".git", "build.zig"),
	on_attach = on_attach,
	capabilities = capabilities,
})

local jsonlsCapabilities = vim.lsp.protocol.make_client_capabilities()
jsonlsCapabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig["jsonls"].setup({
	on_attach = on_attach,
	capabilities = jsonlsCapabilities,
})

for _, lsp in ipairs(lspBatch) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

--
-- lspconfig.pyright.setup { blabla}
