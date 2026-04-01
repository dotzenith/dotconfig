vim.schedule(function()
  vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.surround', version = 'aa5e245829dd12d8ff0c96ef11da28681d6049aa' },
  })

  require('mini.surround').setup {
    mappings = {
      add = '<leader>sa',
      delete = '<leader>sd',
      replace = '<leader>sr',
    },
  }
end)
