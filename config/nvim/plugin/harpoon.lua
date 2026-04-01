vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim', version = 'b9fd5226c2f76c951fc8ed5923d85e4de065e509' },
  { src = 'https://github.com/ThePrimeagen/harpoon',  version = 'ed1f853847ffd04b2b61c314865665e1dadf22c7' },
})

local harpoon = require("harpoon")
---@diagnostic disable-next-line: missing-parameter
harpoon:setup()

vim.keymap.set("n", "<leader><tab>", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>H", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<m-j>", function() harpoon:list():next() end)
vim.keymap.set("n", "<m-k>", function() harpoon:list():prev() end)
