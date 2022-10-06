if vim.fn.exists('g:vscodium') ~= 0 or vim.fn.exists('g:vscode') ~= 0 then
  require "core"
else
  require "core"
  require "lsp"
  require "plugins"
  require "colors"
end
