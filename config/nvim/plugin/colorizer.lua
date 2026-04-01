vim.pack.add({
  { src = 'https://github.com/catgoose/nvim-colorizer.lua', version = 'c8c2c19436d33165ec34fa90c975bc0a739fe3fb' },
})

require("colorizer").setup {
  parsers = { css = true, names = { enable = false } },
  filetypes = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
    "css",
    "html",
    "astro",
    "toml",
    "lua",
    "rust",
  },
}
