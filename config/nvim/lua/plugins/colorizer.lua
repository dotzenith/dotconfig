local M = {
  "catgoose/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  commit = "c8c2c19436d33165ec34fa90c975bc0a739fe3fb"
}

function M.config()
  require("colorizer").setup {
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "css",
      "html",
      "astro",
      "toml",
      "lua",
    },
    user_default_options = {
      names = false,
      rgb_fn = true,
      hsl_fn = true,
      tailwind = "both",
    },
    buftypes = {},
  }
end

return M
