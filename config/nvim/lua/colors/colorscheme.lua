local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

vim.g.catppuccin_flavour = "mocha"

catppuccin.setup(
  {
    transparent_background = true,
    term_colors = true,
    compile = {
      enabled = true,
      path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = { "bold" },
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      cmp = true,
      gitsigns = false,
      telescope = true,
      nvimtree = true,
      which_key = false,
      dashboard = true,
      markdown = true,
      leap = true,
      ts_rainbow = true,
      lualine = false,
    },
    color_overrides = {
        mocha = {
            mauve = "#DDB6F2",
            red = "#F28FAD",
            maroon = "#E8A2AF",
            green = "#ABE9B3",
            blue = "#96CDFB",
            lavender = "#C9CBFF",
        },
    },
    highlight_overrides = {},
  }
)

-- Setting the colorscheme
vim.cmd [[
  try
    colorscheme catppuccin
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

-- Turning off bg color for a lot of components
vim.cmd [[
  hi Normal guibg=none ctermbg=none
  hi LineNr guibg=none ctermbg=none
  hi Folded guibg=none ctermbg=none
  hi NonText guibg=none ctermbg=none
  hi SpecialKey guibg=none ctermbg=none
  hi VertSplit guibg=none ctermbg=none
  hi SignColumn guibg=none ctermbg=none
  hi EndOfBuffer guibg=none ctermbg=none
  hi StatusLine guibg=NONE
  hi StatusLineNC guibg=NONE guifg=NONE
  hi Pmenu guibg=NONE ctermbg=none
  hi NormalFloat guibg=NONE ctermbg=NONE
]]

-- Turning off bg for lsp diagnostics
vim.cmd [[
  hi DiagnosticError guibg=none ctermbg=none
  hi DiagnosticWarn guibg=none ctermbg=none 
  hi DiagnosticHint guibg=none ctermbg=none 
  hi DiagnosticInfo guibg=none ctermbg=none 
]]

-- Turning off git diff bg
vim.cmd [[
  hi DiffAdd guifg=#a6e3a1 guibg=none ctermbg=none
  hi DiffChange guifg=#fab387 guibg=none ctermbg=none
  hi DiffDelete guifg=#f38ba8 guibg=none ctermbg=none
]]
