vim.schedule(function()
  vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.files', version = '01001e0cfc1e79f581d055ae3f70fbac96a2f378' },
  })

  require('mini.files').setup()
  vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua MiniFiles.open()<CR>', { noremap = true, silent = true })
end)
