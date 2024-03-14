local M = {
  "windwp/nvim-autopairs",
  commit = "c6139ca0d5ad7af129ea6c89cb4c56093f2c034a"
}

M.config = function()
  require("nvim-autopairs").setup {
    check_ts = true,
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
  }
end

return M
