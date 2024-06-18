local M = {
  "ggandor/leap.nvim",
  commit = "24935d06c7e06bf8929feb24a3525cd128fc0cc4",
  dependencies = {
    { "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" },
  },
}

function M.config()
  require("leap").set_default_keymaps()
end

return M
