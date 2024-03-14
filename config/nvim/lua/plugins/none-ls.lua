local M = {
  "nvimtools/none-ls.nvim",
  commit = "b8fd44ee1616e6a9c995ed5f94ad9f1721d303ef",
  dependencies = {
    "nvim-lua/plenary.nvim",
    commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7",
  }
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics =  null_ls.builtins.diagnostics

  null_ls.setup {
    debug = false,
    sources = {
      formatting.black.with { extra_args = { "--fast" } },
      diagnostics.ruff,
      formatting.isort,
      formatting.rustfmt,
    }
  }
end

return M
