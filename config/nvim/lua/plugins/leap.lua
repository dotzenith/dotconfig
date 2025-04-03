local M = {
  "ggandor/leap.nvim",
  commit = "346a16ef942635a8ca5ff92e603d07e7e8be6cbe",
  dependencies = {
    { "tpope/vim-repeat", commit = "65846025c15494983dafe5e3b46c8f88ab2e9635" },
  },
}

function M.config()
  require("leap").set_default_keymaps()
end

return M
