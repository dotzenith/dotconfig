local M = {
  "williamboman/mason.nvim",
  commit = "fc98833b6da5de5a9c5b1446ac541577059555be",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim", commit = "1a31f824b9cd5bc6f342fc29e9a53b60d74af245" },
    { "jay-babu/mason-null-ls.nvim", commit = "de19726de7260c68d94691afb057fa73d3cc53e7" },
  },
}

function M.config()
  require("mason").setup()
  require("mason-lspconfig").setup {
      ensure_installed = { 
        "pyright",
        "clangd",
        "tinymist",
      }
  }
  require("mason-null-ls").setup {
    ensure_installed = { "black", "isort", "ruff" },
    automatic_installation = false,
    handlers = {},
  }
end

return M
