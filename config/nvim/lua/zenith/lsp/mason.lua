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
  "yamlls",
  "tsserver",
  "pyright",
  "bashls",
  "clangd",
  "rust_analyzer",
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
    on_attach = require("zenith.lsp.handlers").on_attach,
    capabilities = require("zenith.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "jsonls" then
    local jsonls_opts = require "zenith.lsp.settings.jsonls"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server == "yamlls" then
    local yamlls_opts = require "zenith.lsp.settings.yamlls"
    opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
  end

  if server == "tsserver" then
    local tsserver_opts = require "zenith.lsp.settings.tsserver"
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "zenith.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "rust_analyzer" then
    local rust_opts = require "zenith.lsp.settings.rust"
    -- opts = vim.tbl_deep_extend("force", rust_opts, opts)
    local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
    if not rust_tools_status_ok then
      return
    end

    rust_tools.setup(rust_opts)
    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
