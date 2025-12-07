local M = {
  "nvim-mini/mini.surround",
  version = "0.15.0",
  event = "VeryLazy",
}

function M.config()
  require('mini.surround').setup {
    mappings = {
      add = '<leader>sa',          -- Add surrounding in Normal and Visual modes
      delete = '<leader>sd',       -- Delete surrounding
      replace = '<leader>sr',      -- Replace surrounding
    },
  }
end

return M
