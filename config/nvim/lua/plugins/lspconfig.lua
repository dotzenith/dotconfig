return {
  'neovim/nvim-lspconfig',
  version = 'v2.0.0',
  lazy = false,

	init = function()
		local lspConfigPath = require("lazy.core.config").options.root .. "/nvim-lspconfig"
		vim.opt.runtimepath:append(lspConfigPath)
	end,
}
