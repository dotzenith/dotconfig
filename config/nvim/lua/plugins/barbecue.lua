local M = {
  "utilyre/barbecue.nvim",
  commit = "814140c81247dbc701e20950d76f3dbd5fc31612",
  dependencies = {
      {"SmiteshP/nvim-navic"},
  },
}

function M.config()
  require("barbecue").setup {
    theme = "catppuccin",
    exclude_filetypes = { "gitcommit", "toggleterm", "NvimTree", "alpha", "sshconfig", "exports", "sudoers", "" },
    show_dirname = false,
  }
end

return M
