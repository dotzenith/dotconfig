local M = {
  "nvim-treesitter/nvim-treesitter",
  commit = "7caec274fd19c12b55902a5b795100d21531391f",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects", commit = "93d60a475f0b08a8eceb99255863977d3a25f310" },
    { "HiPhish/rainbow-delimiters.nvim",             commit = "50080ed0f44dbc18ae13b81278a01b951a06127a" },
  },
}

function M.config()
  require("nvim-treesitter").setup {
    install_dir = vim.fn.stdpath("data") .. "/site",
  }

  require("nvim-treesitter").install {
    "html",
    "css",
    "c",
    "cpp",
    "bash",
    "javascript",
    "typescript",
    "lua",
    "vim",
    "regex",
    "rust",
    "python",
    "json",
    "haskell",
    "go",
    "typst",
  }

  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "html", "css", "c", "cpp", "bash", "javascript", "typescript",
      "lua", "vim", "regex", "rust", "python", "json", "haskell", "go", "typst",
    },
    callback = function()
      vim.treesitter.start()
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "html", "css", "cpp", "bash", "javascript", "typescript",
      "lua", "vim", "regex", "rust", "python", "json", "haskell", "go", "typst",
    },
    callback = function()
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })

  require("nvim-treesitter-textobjects").setup {
    select = {
      lookahead = true,
    },
    move = {
      set_jumps = true,
    },
  }

  local select_textobject = require("nvim-treesitter-textobjects.select").select_textobject
  local select_maps = {
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@call.outer",
    ["ic"] = "@call.inner",
    ["ai"] = "@conditional.outer",
    ["ii"] = "@conditional.inner",
    ["al"] = "@loop.outer",
    ["il"] = "@loop.inner",
    ["ap"] = "@parameter.outer",
    ["ip"] = "@parameter.inner",
  }
  for key, capture in pairs(select_maps) do
    vim.keymap.set({ "x", "o" }, key, function()
      select_textobject(capture, "textobjects")
    end)
  end

  local move = require("nvim-treesitter-textobjects.move")
  vim.keymap.set({ "n", "x", "o" }, "]]", function()
    move.goto_next_start("@function.outer", "textobjects")
  end)
  vim.keymap.set({ "n", "x", "o" }, "][", function()
    move.goto_next_end("@function.outer", "textobjects")
  end)
  vim.keymap.set({ "n", "x", "o" }, "[[", function()
    move.goto_previous_start("@function.outer", "textobjects")
  end)
  vim.keymap.set({ "n", "x", "o" }, "[]", function()
    move.goto_previous_end("@function.outer", "textobjects")
  end)
  vim.keymap.set({ "n", "x", "o" }, "=", function()
    move.goto_next_start("@parameter.inner", "textobjects")
  end)
  vim.keymap.set({ "n", "x", "o" }, "-", function()
    move.goto_previous_start("@parameter.inner", "textobjects")
  end)

  local swap = require("nvim-treesitter-textobjects.swap")
  vim.keymap.set("n", "<leader>a", function()
    swap.swap_next("@parameter.inner")
  end)
  vim.keymap.set("n", "<leader>A", function()
    swap.swap_previous("@parameter.inner")
  end)

  vim.g.rainbow_delimiters = {
    strategy = {
      [""] = "rainbow-delimiters.strategy.global",
    },
    query = {
      [""] = "rainbow-delimiters",
    },
    highlight = {
      "RainbowDelimiterRed",
      "RainbowDelimiterYellow",
      "RainbowDelimiterBlue",
      "RainbowDelimiterOrange",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterCyan",
    },
  }
end

return M
