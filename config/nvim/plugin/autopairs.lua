vim.pack.add({
  { src = 'https://github.com/windwp/nvim-autopairs', version = '84a81a7d1f28b381b32acf1e8fe5ff5bef4f7968' },
})

require("nvim-autopairs").setup {
  check_ts = true,
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
}
