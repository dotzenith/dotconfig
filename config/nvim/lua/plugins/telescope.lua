local M = {
  "nvim-telescope/telescope.nvim",
  commit = "a4ed82509cecc56df1c7138920a1aeaf246c0ac5",
  dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true, commit = "1f08ed60cafc8f6168b72b80be2b2ea149813e55"} },
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>f", group = "Find" },
    { "<leader>fb", "<cmd>Telescope buffers previewer=false<cr>", desc = "Show Buffers" },
    { "<leader>fgb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "References" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Recent File" },
    { "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
    { "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
    { "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
  }

  local actions = require "telescope.actions"

  require("telescope").setup {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },

      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      live_grep = {
        theme = "dropdown",
      },

      grep_string = {
        theme = "dropdown",
      },

      find_files = {
        theme = "dropdown",
        previewer = false,
      },

      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      colorscheme = {
        enable_preview = true,
      },

      lsp_references = {
        initial_mode = "normal",
      },

      lsp_definitions = {
        initial_mode = "normal",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }
end

return M
