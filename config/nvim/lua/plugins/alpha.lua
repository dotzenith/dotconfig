local M = {
  "goolord/alpha-nvim",
  commit = "712dc1dccd4fd515ef8bd126b3718f79d3e23b0d",
  event = "VimEnter",
}

function M.config()
  local dashboard = require "alpha.themes.dashboard"

  dashboard.section.header.val = {
   [[     ___           ___           ___                       ___           ___     ]],
   [[    /\  \         /\  \         /\__\          ___        /\  \         /\__\    ]],
   [[    \:\  \       /::\  \       /::|  |        /\  \       \:\  \       /:/  /    ]],
   [[     \:\  \     /:/\:\  \     /:|:|  |        \:\  \       \:\  \     /:/__/     ]],
   [[      \:\  \   /::\~\:\  \   /:/|:|  |__      /::\__\      /::\  \   /::\  \ ___ ]],
   [[_______\:\__\ /:/\:\ \:\__\ /:/ |:| /\__\  __/:/\/__/     /:/\:\__\ /:/\:\  /\__\]],
   [[\::::::::/__/ \:\~\:\ \/__/ \/__|:|/:/  / /\/:/  /       /:/  \/__/ \/__\:\/:/  /]],
   [[ \:\~~\~~      \:\ \:\__\       |:/:/  /  \::/__/       /:/  /           \::/  / ]],
   [[  \:\  \        \:\ \/__/       |::/  /    \:\__\       \/__/            /:/  /  ]],
   [[   \:\__\        \:\__\         /:/  /      \/__/                       /:/  /   ]],
   [[    \/__/         \/__/         \/__/                                   \/__/    ]],
   [[                                                                                 ]],
  }

  dashboard.section.buttons.val = {
    dashboard.button("f", "󰍉  Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "󱄽  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("q", "󰿅  Quit Neovim", ":qa<CR>"),
  }

  dashboard.section.header.opts.hl = "Keyword"
  dashboard.section.buttons.opts.hl = "Include"
  dashboard.section.footer.opts.hl = "Type"

  dashboard.opts.opts.noautocmd = true
  require("alpha").setup(dashboard.opts)

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function()
      vim.cmd [[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
    end,
  })
end

return M
