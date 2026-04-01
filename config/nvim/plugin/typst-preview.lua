vim.api.nvim_create_autocmd('FileType', { pattern = 'typst', once = true, callback = function()
  vim.pack.add({
    { src = 'https://github.com/chomosuke/typst-preview.nvim', version = '325036ee145ca51d9efb145c09ac16bce3bc8b7d' },
  })

  require('typst-preview').setup({})
end })
