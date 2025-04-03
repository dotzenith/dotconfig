local M = {
  'saghen/blink.cmp',
  version = 'v1.1.1',
  lazy = false,
  dependencies = {
    { "rafamadriz/friendly-snippets", commit = "efff286dd74c22f731cdec26a70b46e5b203c619" },
  },
}

function M.config()
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
end

return M
