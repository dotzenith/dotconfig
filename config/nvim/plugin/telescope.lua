vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim',                      version = 'b9fd5226c2f76c951fc8ed5923d85e4de065e509' },
  { src = 'https://github.com/folke/which-key.nvim',                       version = '370ec46f710e058c9c1646273e6b225acf47cbed' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim',              version = '5255aa27c422de944791318024167ad5d40aad20' },
})

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
    prompt_prefix = " ",
    selection_caret = " ",
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
}

require("telescope").load_extension("projects")
