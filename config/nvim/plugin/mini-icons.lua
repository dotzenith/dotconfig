vim.schedule(function()
  vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.icons', version = '910db5df9724d65371182948f921fce23c2c881e' },
  })

  require('mini.icons').setup()
end)
