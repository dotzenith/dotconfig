local M = {
  "letieu/harpoon-lualine",
  commit = "4e08b6a41430e2a7be562bcc132d281a299bbfd8",
  dependencies = {
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      commit = "a38be6e0dd4c6db66997deab71fc4453ace97f9c",
    }
  },
  opts = {}
}

M.config = function()
  local harpoon = require("harpoon")
  ---@diagnostic disable-next-line: missing-parameter
  harpoon:setup()

  vim.keymap.set("n", "<leader><tab>", function() harpoon:list():append() end)
  vim.keymap.set("n", "<leader>H", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set("n", "<m-j>", function() harpoon:list():next() end)
  vim.keymap.set("n", "<m-k>", function() harpoon:list():prev() end)
end

return M
