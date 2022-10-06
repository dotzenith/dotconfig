local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = require("colors.luacat").theme(),
    component_separators = '',
    section_separators = '',
    disabled_filetypes = {"alpha"},
    always_divide_middle = true,
    globalstatus = true
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 
                {
                    'diff',
                    colored = true, 
                    diff_color = {
                      added    = 'DiffAdd', 
                      modified = 'DiffChange',
                      removed  = 'DiffDelete',
                    },
                },
                {
                    'diagnostics',

                    sources = { 'nvim_lsp' },
                    sections = { 'error', 'warn', 'info' },

                    diagnostics_color = {
                      error = 'DiagnosticError', 
                      warn  = 'DiagnosticWarn',  
                      info  = 'DiagnosticInfo',  
                    },
                    colored = true,           
                    update_in_insert = false, 
                    always_visible = false,   
                },
    },
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {''},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

