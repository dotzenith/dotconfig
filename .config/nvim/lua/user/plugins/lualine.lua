local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = require('user.colors.luacat').theme(),
    component_separators = '',
    section_separators = '',
    disabled_filetypes = {"NvimTree", "alpha"},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 
                {
                    'diff',
                    colored = true, 
                    diff_color = {
                      added    = { fg = "#ABE9B3"}, 
                      modified = { fg = "#FAE3B0"},
                      removed  = { fg = "#F27FAD"},
                    },
                }, 
                'diagnostics'},
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

