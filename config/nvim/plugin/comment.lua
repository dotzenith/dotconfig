vim.schedule(function()
  vim.pack.add({
    { src = 'https://github.com/folke/ts-comments.nvim', version = '123a9fb12e7229342f807ec9e6de478b1102b041' },
  })

  require('ts-comments').setup({})
end)
