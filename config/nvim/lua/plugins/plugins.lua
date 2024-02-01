local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    -- Misc plugins
    { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" },
    { "numToStr/Comment.nvim", commit = "0236521ea582747b58869cb72f70ccfa967d2e89", event = {"BufRead", "BufNewFile"},
      dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", commit = "9bff161dfece6ecf3459e6e46ca42e49f9ed939f"},
    },
    { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" },
    { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },
    { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" },
    { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" },
    { "RRethy/vim-illuminate", commit = "d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298" },
    { "ThePrimeagen/harpoon", commit = "c1aebbad9e3d13f20bedb8f2ce8b3a94e39e424a" },

    -- UI
    { "goolord/alpha-nvim", commit = "712dc1dccd4fd515ef8bd126b3718f79d3e23b0d", event = "VimEnter"},
    { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" },
    { "nvim-tree/nvim-web-devicons", commit = "cdbcca210cf3655aa9b31ebf2422763ecd85ee5c" },
    { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" },
    { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" },
    { "folke/which-key.nvim", commit = "7ccf476ebe0445a741b64e36c78a682c1c6118b7" },
    { "karb94/neoscroll.nvim", commit = "54c5c419f6ee2b35557b3a6a7d631724234ba97a" },
    { "nvim-lualine/lualine.nvim", commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63" },
    { "nvim-zh/colorful-winsep.nvim", commit = "956d65c9a31ce81b7873bef1682c72eb00d9affb"},

    -- Colorschemes
    { "catppuccin/nvim", commit = "939be5f7fcbc15abeaad9214bb253a4551f6f6e6", name = "catppuccin" },
    { "norcalli/nvim-colorizer.lua", commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" },

    -- cmp plugins
    { "hrsh7th/nvim-cmp", commit = "5dce1b778b85c717f6614e3f4da45e9f19f54435" },
    { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" },
    { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }, 
    { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" },
    { "hrsh7th/cmp-nvim-lsp", commit = "44b16d11215dce86f253ce0c30949813c0a90765" },
    { "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada8" },
    { "hrsh7th/cmp-cmdline", commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063" },

    -- snippets
    { "L3MON4D3/LuaSnip", commit = "ea7d7ea510c641c4f15042becd27f35b3e5b3c2b" },
    { "rafamadriz/friendly-snippets", commit = "ebf6d6e83494cdd88a54a429340256f4dbb6a052" },
    
    -- LSP
    { "neovim/nvim-lspconfig", commit = "50fcf96ec5a6e7bfdcbbea4f905c33e85408f170" },
    { "williamboman/mason.nvim", commit = "d66c60e17dd6fd8165194b1d14d21f7eb2c1697a", 
      dependencies = { "williamboman/mason-lspconfig.nvim", commit = "81e30dd629de24cbb26d08073ee938ab40006695" },
      cmd = "Mason",
    },
    { "jay-babu/mason-null-ls.nvim", commit = "ae0c5fa57468ac65617f1bf821ba0c3a1e251f0c" },
    { "nvimtools/none-ls.nvim", commit = "b8fd44ee1616e6a9c995ed5f94ad9f1721d303ef" },
    { "hedyhli/outline.nvim", commit = "5669c8aa9ea6346ab491646a9a1e73d7f594e2f8"},
    { "utilyre/barbecue.nvim", dependencies = {"SmiteshP/nvim-navic"}, commit = "814140c81247dbc701e20950d76f3dbd5fc31612"},

    -- Telescope
    { "nvim-telescope/telescope.nvim", commit = "a19770625aed49ad2a9f591a5e3946707f7359f6" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", commit = "fab3e2212e206f4f8b3bbaa656e129443c9b802e" },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", commit = "226c1475a46a2ef6d840af9caa0117a439465500" },
    { "nvim-treesitter/nvim-treesitter-textobjects", commit = "bd103502252027434ec42f628d2dbf54821d4ce6", dependencies = {"nvim-treesitter"} },
    { "RRethy/nvim-treesitter-textsubjects", commit = "bc047b20768845fd54340eb76272b2cf2f6fa3f3", dependencies = {"nvim-treesitter"} },
    { "mrjones2014/nvim-ts-rainbow", commit = "aa83e4967bf78f85ffd9a11e159900c7ea7e423b", dependencies = {"nvim-treesitter"} },
    
    -- Git
    { "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" },

    --leap
    { "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" },
    { "ggandor/leap.nvim", commit = "0eb3611593e135150e2f7880ec67568ccb51c17a", dependencies = {"vim-repeat"} },
    { "ggandor/flit.nvim", commit = "f4e9af572a62c808c8de214da672f2a115a98c35", dependencies = {"vim-repeat", "leap.nvim"} },
  },
  {
    defaults = { lazy = false },
    ui = { wrap = "true" },
    change_detection = { enabled = true },
  }
)
