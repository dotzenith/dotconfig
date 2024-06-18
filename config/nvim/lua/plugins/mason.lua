local M = {
  "williamboman/mason-lspconfig.nvim",
  commit = "37a336b653f8594df75c827ed589f1c91d91ff6c",
  dependencies = {
    { "williamboman/mason.nvim",     commit = "0950b15060067f752fde13a779a994f59516ce3d" },
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
    ensure_installed = { "black", "isort", "ruff" },
    automatic_installation = false,
    handlers = {},
  }
end

return M
