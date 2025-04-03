local M = {
  "ggandor/flit.nvim",
  commit = "1ef72de6a02458d31b10039372c8a15ab8989e0d",
}

function M.config()
  require("flit").setup {
    keys = { f = 'f', F = 'F', t = 't', T = 'T' },
    labeled_modes = "nv",
    multiline = true,
    opts = {}
  }
end

return M
