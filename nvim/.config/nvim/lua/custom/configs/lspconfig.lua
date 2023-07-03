local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "bashls",
  "cssls",
  "html",
  "neocmake",
  "tsserver",
}

-- Clangd特殊处理
local clangdCapabilities = vim.lsp.protocol.make_client_capabilities()
clangdCapabilities.offsetEncoding = "utf-8"
lspconfig["clangd"].setup {
    on_attach = on_attach,
    capabilities = clangdCapabilities,
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
