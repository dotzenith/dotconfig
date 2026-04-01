vim.pack.add({
  { src = 'https://github.com/rafamadriz/friendly-snippets', version = '6cd7280adead7f586db6fccbd15d2cac7e2188b9' },
  { src = 'https://github.com/saghen/blink.cmp',             version = '451168851e8e2466bc97ee3e026c3dcb9141ce07' },
})

local blink = require "blink.cmp"

blink.setup {
  appearance = {
    nerd_font_variant = 'mono'
  },

  keymap = {
    ['<C-e>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-space>'] = { 'hide', 'fallback' },
    ['<CR>'] = { 'accept', 'fallback' },

    ['<M-Right>'] = { 'snippet_forward', 'fallback' },
    ['<M-Left>'] = { 'snippet_backward', 'fallback' },

    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
    ['<C-k>'] = { 'select_prev', 'fallback' },
    ['<C-j>'] = { 'select_next', 'fallback' },

    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
  },

  completion = {
    list = {
      selection = { preselect = false, auto_insert = false },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 100,
      treesitter_highlighting = true,
    },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
}
