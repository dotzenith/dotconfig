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
  use { "wbthomason/packer.nvim", commit = "1d0cf98a561f7fd654c970c49f917d74fafe1530" } 

  -- Misc plugins
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }  
  use { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }  
  use { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }
  use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }
  use { "RRethy/vim-illuminate", commit = "d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298" }
  use { "ThePrimeagen/harpoon", commit = "8cb54c4003045fe1b690de96638d334de9449546" }

  -- UI
  use { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" } 
  use { "kyazdani42/nvim-web-devicons", commit = "0568104bf8d0c3ab16395433fcc5c1638efc25d4" }
  use { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" }
  use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }
  use { "folke/which-key.nvim", commit = "1b7f09a38afb48e295109137790c3a3099881c2f" }
  use { "karb94/neoscroll.nvim", commit = "54c5c419f6ee2b35557b3a6a7d631724234ba97a" }
  use { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }
  use { "nvim-zh/colorful-winsep.nvim", commit = "956d65c9a31ce81b7873bef1682c72eb00d9affb"}

  -- Colorschemes
  use { "catppuccin/nvim", commit = "939be5f7fcbc15abeaad9214bb253a4551f6f6e6", as = "catppuccin" }
  use { "norcalli/nvim-colorizer.lua", commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "777450fd0ae289463a14481673e26246b5e38bf2" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef" }
  use { "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada8" }
  use { "hrsh7th/cmp-cmdline", commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063" } -- cmdline completions

  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "8d6c0a93dec34900577ba725e91c44b8d3ca1f45" }
  use { "rafamadriz/friendly-snippets", commit = "b1b78a6433268fc172adb5a843e165035e83861e" } 
  
  -- LSP
  use { "neovim/nvim-lspconfig", commit = "32a5543fe3a7f108c1488c265052572abbf6f588" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "08b2fd308e0107eab9f0b59d570b69089fd0b522"}
  use { "williamboman/mason-lspconfig.nvim", commit = "90a8bbf106b85b76951a34c542058ffa807de2b1" }
  use { "jose-elias-alvarez/null-ls.nvim", commit = "77e53bc3bac34cc273be8ed9eb9ab78bcf67fa48" } -- for formatters and linters
  use { "jay-babu/mason-null-ls.nvim", commit = "834bb5d6dd72db0a82d4b90a25500fdc14a3bc43"}
  use { "simrat39/symbols-outline.nvim", commit = "512791925d57a61c545bc303356e8a8f7869763c"}
  use { "utilyre/barbecue.nvim", requires = "SmiteshP/nvim-navic", commit = "814140c81247dbc701e20950d76f3dbd5fc31612"}

  -- Telescope
  use { "nvim-telescope/telescope.nvim", commit = "6258d50b09f9ae087317e392efe7c05a7323492d" }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', commit = "fab3e2212e206f4f8b3bbaa656e129443c9b802e" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", commit = "226c1475a46a2ef6d840af9caa0117a439465500"} 
  use { "nvim-treesitter/nvim-treesitter-textobjects", commit = "35a60f093fa15a303874975f963428a5cd24e4a0", after = "nvim-treesitter"}
  use { "RRethy/nvim-treesitter-textsubjects", commit = "bc047b20768845fd54340eb76272b2cf2f6fa3f3", after = "nvim-treesitter"}
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "729d83ecb990dc2b30272833c213cc6d49ed5214", after = "nvim-treesitter" }
  use { "mrjones2014/nvim-ts-rainbow", commit = "aa83e4967bf78f85ffd9a11e159900c7ea7e423b", after = "nvim-treesitter" }
  
  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" }

  --leap
  use { "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" }
  use { "ggandor/leap.nvim", commit = "0eb3611593e135150e2f7880ec67568ccb51c17a" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
