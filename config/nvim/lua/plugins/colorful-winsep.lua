local M = {
  "nvim-zh/colorful-winsep.nvim",
  commit = "956d65c9a31ce81b7873bef1682c72eb00d9affb"
}

function M.config()
  require("colorful-winsep").setup {
    highlight = {
      fg = "#fab387",
    },
    -- timer refresh rate
    interval = 30,
    -- This plugin will not be activated for filetype in the following table.
    no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
    -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
    symbols = { "─", "│", "╭", "╮", "╰", "╯" },
    close_event = function()
      -- Executed after closing the window separator
    end,
    create_event = function()
      -- Executed after creating the window separator
    end,
  }
end

return M
