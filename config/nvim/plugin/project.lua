vim.pack.add({
  { src = 'https://github.com/ahmedkhalf/project.nvim', version = '8c6bad7d22eef1b71144b401c9f74ed01526a4fb' },
})

require("project_nvim").setup {
  active = true,
  on_config_done = nil,
  manual_mode = false,
  detection_methods = { "pattern" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
  ignore_lsp = {},
  exclude_dirs = {},
  show_hidden = false,
  silent_chdir = true,
  scope_chdir = "global",
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-p>", ":lua require('telescope').extensions.projects.projects()<CR>", opts)
