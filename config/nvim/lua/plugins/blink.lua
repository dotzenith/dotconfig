local M = {
	'saghen/blink.cmp',
	lazy = false,

	dependencies = {
		{ "rafamadriz/friendly-snippets", commit = "de8fce94985873666bd9712ea3e49ee17aadb1ed" },
	},

	version = 'v0.6.2',
}


function M.config()
	local blink = require "blink.cmp"

	blink.setup {
		keymap = {
			['<C-e>'] = { 'show', 'show_documentation', 'hide_documentation' },
			['<C-space>'] = { 'hide', 'fallback' },
			['<CR>'] = { 'accept', 'fallback' },

			['<Left>'] = { 'snippet_backward', 'fallback' },
			['<Right>'] = { 'snippet_forward', 'fallback' },

			['<Tab>'] = { 'select_next', 'fallback' },
			['<S-Tab>'] = { 'select_prev', 'fallback' },
			['<C-k>'] = { 'select_prev', 'fallback' },
			['<C-j>'] = { 'select_next', 'fallback' },

			['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
			['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
		},
		windows = {
			autocomplete = {
				border = 'rounded',
				selection = 'manual',
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				update_delay_ms = 50,
				treesitter_highlighting = true,
				border = "rounded"
			},
			signature_help = {
				border = "rounded",
			}
		},
		sources = {
			completion = {
				enabled_providers = { 'lsp', 'path', 'snippets', 'buffer' },
			},
		},
	}
end

return M
