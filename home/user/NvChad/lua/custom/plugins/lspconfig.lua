-- custom.plugins.lspconfig
local capabilities = require("plugins.configs.lspconfig").capabilities

local _, lspconfig = pcall(require, "lspconfig")

local servers = {"pyright", "tsserver", "eslint"}

local lsp_format = require "lsp-format"

local on_attach = function(client, buffer)
  lsp_format.on_attach(client)
  require("plugins.configs.lspconfig").on_attach(client, buffer)
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
