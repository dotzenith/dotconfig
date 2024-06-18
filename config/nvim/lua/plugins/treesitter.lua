local M = {
  "nvim-treesitter/nvim-treesitter",
  commit = "c29989f5d735a30b6d2350b54d5cd50be811f8b2",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects", commit = "fd41b7ccc5490a3a99c734d1ee418b68d06c48a9" },
    { "RRethy/nvim-treesitter-textsubjects",         commit = "9f9a6b307fb122f13708f78483222abd43b7bb3a" },
    { "HiPhish/rainbow-delimiters.nvim",             commit = "5c9660801ce345cd3835e1947c12b54290ab7e71" },
  },
}

function M.config()
  ---@diagnostic disable-next-line: missing-fields
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "html",
      "css",
      "c",
      "cpp",
      "bash",
      "javascript",
      "typescript",
      "java",
      "lua",
      "vim",
      "regex",
      "rust",
      "python",
      "json",
      "haskell",
      "go",
      "typst",
    },
    sync_install = false,    -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    autopairs = {
      enable = true,
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = {},  -- list of language that will be disabled
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { "yaml", "c" } },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },
    textsubjects = {
      enable = true,
      prev_selection = ',', -- (Optional) keymap to select the previous selection
      keymaps = {
        ['.'] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer',
        ['i;'] = 'textsubjects-container-inner',
      },
    },
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@call.outer",
          ["ic"] = "@call.inner",
          ['ai'] = '@conditional.outer',
          ['ii'] = '@conditional.inner',
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
          ['ap'] = '@parameter.outer',
          ['ip'] = '@parameter.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]]"] = "@function.outer",
          ["="] = "@parameter.inner"
        },
        goto_next_end = {
          ["]["] = "@function.outer",
        },
        goto_previous_start = {
          ["[["] = "@function.outer",
          ["-"] = "@parameter.inner"
        },
        goto_previous_end = {
          ["[]"] = "@function.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
  }
end

return M
