if exists('g:vscodium') || exists('g:vscode')
  lua require("zenith.core")
else
  lua require("zenith.core")
  lua require("zenith.lsp")
  lua require("zenith.plugins")
  lua require("zenith.colors")
endif
