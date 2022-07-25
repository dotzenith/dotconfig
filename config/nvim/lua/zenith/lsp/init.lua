local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "zenith.lsp.mason"
require "zenith.lsp.lsp-signature"
require("zenith.lsp.handlers").setup()
require "zenith.lsp.null-ls"
