local M = {
  "nvimtools/none-ls.nvim",
  commit = "c9317c2a8629d4e39e7cf47be74cb67f3ab37cda",
  dependencies = {
    "nvim-lua/plenary.nvim",
    commit = "b9fd5226c2f76c951fc8ed5923d85e4de065e509",
  }
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics =  null_ls.builtins.diagnostics

  null_ls.setup {
    debug = true,
    sources = {
      formatting.black.with { extra_args = { "--fast" } },
      formatting.isort,
    }
  }
end

return M
