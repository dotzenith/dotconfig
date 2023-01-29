if vim.g.vscode or vim.g.vscodium then
  require "core"
  require "plugins"
  return
end

require "core"
require "lsp"
require "plugins"
require "colors"
