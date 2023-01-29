local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins here
return packer.startup(function(use)
  
  -- Have packer manage itself
  use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } 

  -- Misc plugins
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }  
  use { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }  
  use { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }
  use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }

  -- UI
  use { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" } 
  use { "noib3/nvim-cokeline", commit = "501f93ec84af0d505d95d3827cad470b9c5e86dc" }
  use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
  use { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" }
  use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }
  use { "folke/which-key.nvim", commit = "1b7f09a38afb48e295109137790c3a3099881c2f" }
  use { "karb94/neoscroll.nvim", commit = "54c5c419f6ee2b35557b3a6a7d631724234ba97a" }
  use { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }

  -- Colorschemes
  use { "catppuccin/nvim", commit = "98b2b7eb3e743289a674d7255e2557f3a20153ba", as = "catppuccin" }
  use { "norcalli/nvim-colorizer.lua", commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "11a95792a5be0f5a40bab5fc5b670e5b1399a939" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" }
  use { "hrsh7th/cmp-nvim-lua", commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6" }
  use { "hrsh7th/cmp-cmdline", commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063" } -- cmdline completions

  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" }
  use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } 
  
  -- LSP
  use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "bfc5997e52fe9e20642704da050c415ea1d4775f"}
  use { "williamboman/mason-lspconfig.nvim", commit = "0eb7cfefbd3a87308c1875c05c3f3abac22d367c" }
  use { "jose-elias-alvarez/null-ls.nvim", commit = "7b2b28e207a1df4ebb13c7dc0bd83f69b5403d71" } -- for formatters and linters

  -- Telescope
  use { "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', commit = "fab3e2212e206f4f8b3bbaa656e129443c9b802e" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", commit = "c610c78576f372684f42eeaec56d13be2cf304d2"} 
  use { "nvim-treesitter/nvim-treesitter-textobjects", commit = "71cee2f7b1211fe35918ce5fd0f626c48d9c1e3d", after = "nvim-treesitter"}
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08", after = "nvim-treesitter" }
  use { "p00f/nvim-ts-rainbow", commit = "fad8badcd9baa4deb2cf2a5376ab412a1ba41797", after = "nvim-treesitter" }
  
  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" }

  --leap
  use { "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" }
  use { "ggandor/leap.nvim", commit = "847a1dcfb1a3a576860151754d95fb3b0014663e" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
