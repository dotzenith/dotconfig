vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim',   version = 'b9fd5226c2f76c951fc8ed5923d85e4de065e509' },
  { src = 'https://github.com/nvimtools/none-ls.nvim',  version = 'c9317c2a8629d4e39e7cf47be74cb67f3ab37cda' },
})

local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting

null_ls.setup {
  debug = true,
  sources = {
    formatting.black.with { extra_args = { "--fast" } },
    formatting.isort,
  }
}
