local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok then
	return
end

mason_null_ls.setup {
  ensure_installed = {"black", "isort", "ruff"},
  automatic_installation = false,
  handlers = {},
}

local servers = {
  "jsonls",
  "pyright",
  "bashls",
  "clangd",
  "gopls",
  "jdtls",
  "tsserver",
  "sqlls",
  "hls"
}

local manual = {
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
  automatic_installation = false,
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

	local require_ok, conf_opts = pcall(require, "lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

  lspconfig[server].setup(opts)
end


local manual_opts = {}
for _, manual_server in pairs(manual) do
  manual_opts = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
  }

  manual_server = vim.split(manual_server, "@")[1]

	local require_manual_ok, manual_conf_opts = pcall(require, "lsp.settings." .. manual_server)
	if require_manual_ok then
		manual_opts = vim.tbl_deep_extend("force", manual_conf_opts, manual_opts)
	end

  lspconfig[manual_server].setup(manual_opts)
end
