local M = {
  "Bekaboo/dropbar.nvim",
  version = "14.2.1",
}

function M.config()
  require('dropbar').setup()
end

return M
