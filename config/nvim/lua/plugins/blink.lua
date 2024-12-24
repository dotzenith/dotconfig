local M = {
	'saghen/blink.cmp',
	version = 'v0.8.2',
	lazy = false,
	dependencies = {
		{ "rafamadriz/friendly-snippets", commit = "de8fce94985873666bd9712ea3e49ee17aadb1ed" },
	},
}

function M.config()
	local blink = require "blink.cmp"

	blink.setup {
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
				selection = 'manual',
			},
			menu = {
				border = 'rounded',
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
				update_delay_ms = 0,
				treesitter_highlighting = true,
				window = {
					border = "rounded",
				},
			},
		},
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},
	}


end

return M
