local M = {
  url = "https://codeberg.org/andyg/leap.nvim.git",
  commit = "af1dedf49efe203b98c65970a6bb652af256b882",
  dependencies = {
    { "tpope/vim-repeat", commit = "65846025c15494983dafe5e3b46c8f88ab2e9635" },
  },
  lazy = false,
}

function M.config()
  local opts = { noremap = true, silent = true }
  vim.keymap.set({'n', 'o'}, 's',  '<Plug>(leap-forward)', opts)
  vim.keymap.set({'n', 'o'}, 'S',  '<Plug>(leap-backward)', opts)
end

return M
