local M = {
  "williamboman/mason-lspconfig.nvim",
  commit = "81e30dd629de24cbb26d08073ee938ab40006695",
  dependencies = {
    {"williamboman/mason.nvim", commit = "d66c60e17dd6fd8165194b1d14d21f7eb2c1697a"},
    { "jay-babu/mason-null-ls.nvim", commit = "ae0c5fa57468ac65617f1bf821ba0c3a1e251f0c" },
  },
}

function M.config()
  local servers = require "lspsettings.servers"

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }

  require("mason-null-ls").setup {
    ensure_installed = {"black", "isort", "ruff"},
    automatic_installation = false,
    handlers = {},
  }
end

return M
