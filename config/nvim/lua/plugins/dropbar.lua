local M = {
  "Bekaboo/dropbar.nvim",
  version = "12.0.2",
}

function M.config()
  require('dropbar').setup()
end

return M
