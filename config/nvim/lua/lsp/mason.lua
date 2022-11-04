local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local servers = {
  "jsonls",
  "pyright",
  "bashls",
  "clangd",
  "rust_analyzer",
  "gopls",
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "jsonls" then
    local jsonls_opts = require "lsp.settings.jsonls"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "gopls" then
    local go_opts = require "lsp.settings.go"
    opts = vim.tbl_deep_extend("force", go_opts, opts)
  end

  lspconfig[server].setup(opts)
end
