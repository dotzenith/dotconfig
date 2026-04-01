vim.pack.add({
  { src = 'https://github.com/karb94/neoscroll.nvim', version = 'f957373912e88579e26fdaea4735450ff2ef5c9c' },
})

require("neoscroll").setup {
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
  hide_cursor = true,
  stop_eof = true,
  use_local_scrolloff = false,
  respect_scrolloff = false,
  cursor_scrolls_alone = true,
  easing_function = "quadratic",
  pre_hook = nil,
  post_hook = nil,
}
