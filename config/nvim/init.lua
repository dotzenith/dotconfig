if vim.g.vscode or vim.g.vscodium then
  require "core"
else
  require "core"
  require "lsp"
  require "plugins"
  require "colors"
end
