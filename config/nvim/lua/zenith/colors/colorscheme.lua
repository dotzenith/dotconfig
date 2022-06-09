local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

vim.g.catppuccin_flavor = "original"

catppuccin.setup(
  {  
    transparent_background = true,
    term_colors = true,
    styles = {
      comments = "italic",
      functions = "italic",
      keywords = "italic",
      strings = "NONE",
      variables = "italic",
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = "italic",
          hints = "italic",
          warnings = "italic",
          information = "italic",
        },
        underlines = {
          errors = "underline",
          hints = "underline",
          warnings = "underline",
          information = "underline",
        },
      },
      lsp_trouble = false,
      cmp = true,
      lsp_saga = false,
      gitgutter = false,
      gitsigns = false,
      telescope = false,
      nvimtree = {
        enabled = false,
        show_root = false,
        transparent_panel = false,
      },
      neotree = {
        enabled = false,
        show_root = false,
        transparent_panel = false,
      },
      which_key = false,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      dashboard = false,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = true,
      markdown = true,
      lightspeed = false,
      ts_rainbow = true,
      hop = false,
      notify = false,
      telekasten = false,
    },
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
