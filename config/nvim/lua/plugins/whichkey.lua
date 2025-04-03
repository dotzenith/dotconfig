local M = {
  "folke/which-key.nvim",
  commit = "370ec46f710e058c9c1646273e6b225acf47cbed",
}

function M.config()
  local which_key = require "which-key"
  which_key.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    filter = function(mapping)
      -- I don't know how to make which-key ignore properly
      return mapping.desc and mapping.desc ~= "" 
        and not string.match(mapping.desc, "surround")
        and not string.match(mapping.desc, "@parameter")
    end,
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  -- LSP Mappings
  which_key.add {
    {"<leader>l", group = "LSP" },
    {"<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    {"<leader>lf", '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', desc = "Format"},
    {"<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
    {"<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
    {"<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
    {"<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
    {"<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
    {"<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  }

  which_key.add {
    {"<leader>s", group = "Surround" },
    {"<leader>sa", desc = "Add Surrounding" },
    {"<leader>sd", desc = "Delete Surrounding" },
    {"<leader>sf", desc = "Find Surrounding Right" },
    {"<leader>sF", desc = "Find Surrounding left" },
    {"<leader>sh", desc = "Highlight Surrounding" },
    {"<leader>sr", desc = "Replace Surrounding" },
  }

end

return M
