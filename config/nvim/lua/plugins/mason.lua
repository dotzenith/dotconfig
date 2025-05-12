local M = {
  "mason-org/mason.nvim",
  commit = "7c7318e8bae7e3536ef6b9e86b9e38e74f2e125e",
}

function M.config()
  require("mason").setup()
end

return M
