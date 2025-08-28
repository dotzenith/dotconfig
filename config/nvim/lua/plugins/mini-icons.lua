local M = {
  "nvim-mini/mini.icons",
  version = "0.15.0",
  event = "VeryLazy",
}

function M.config()
  require('mini.icons').setup()
end

return M
