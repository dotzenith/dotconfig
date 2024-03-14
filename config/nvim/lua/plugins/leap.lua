local M = {
  "ggandor/leap.nvim",
  commit = "0eb3611593e135150e2f7880ec67568ccb51c17a",
  dependencies = {
    { "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" },
  },
}

function M.config()
  require("leap").set_default_keymaps()
end

return M
