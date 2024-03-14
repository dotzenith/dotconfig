local M = {
  "ggandor/flit.nvim",
  commit = "f4e9af572a62c808c8de214da672f2a115a98c35",
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
