local M = {
  "nvim-mini/mini.files",
  version = "0.15.0",
  event = "VeryLazy",
}

function M.config()
  require('mini.files').setup()
  vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua MiniFiles.open()<CR>', { noremap = true, silent = true })
end

return M
