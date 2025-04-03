local M = {
  "windwp/nvim-autopairs",
  commit = "84a81a7d1f28b381b32acf1e8fe5ff5bef4f7968"
}

M.config = function()
  require("nvim-autopairs").setup {
    check_ts = true,
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
  }
end

return M
