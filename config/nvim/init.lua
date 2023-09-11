if vim.g.vscode or vim.g.vscodium then
  require "core"
  require "plugins"
  return
end

require "core"
require "plugins"
require "colors"
require "lsp"
