local M = {
  "nvimtools/none-ls.nvim",
  commit = "a117163db44c256d53c3be8717f3e1a2a28e6299",
  dependencies = {
    "nvim-lua/plenary.nvim",
    commit = "857c5ac632080dba10aae49dba902ce3abf91b35",
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
