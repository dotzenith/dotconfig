local M = {
  "echasnovski/mini.surround",
  version = "0.14.0",
  event = "VeryLazy",
}

function M.config()
  require('mini.surround').setup {
    mappings = {
      add = 'wa',          -- Add surrounding in Normal and Visual modes
      delete = 'wd',       -- Delete surrounding
      find = 'wf',         -- Find surrounding (to the right)
      find_left = 'wF',    -- Find surrounding (to the left)
      highlight = 'wh',    -- Highlight surrounding
      replace = 'wr',      -- Replace surrounding
      update_n_lines = 'wn', -- Update `n_lines`

      suffix_last = 'l',   -- Suffix to search with "prev" method
      suffix_next = 'n',   -- Suffix to search with "next" method
    },
  }
end

return M
