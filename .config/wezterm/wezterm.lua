local wezterm = require 'wezterm';

return {
  font = wezterm.font("FiraCode Nerd Font", {weight="Medium", italic=false}),

  font_rules = {
    {
      italic = true,
      font = wezterm.font("FiraCode Nerd Font", {weight="Medium", italic=false}),
    },
    {
      intensity = "Bold",
      font = wezterm.font("FiraCode Nerd Font", {weight="Bold", italic=false}),
    },
  },
  
  font_size = 16.0,
  
  color_scheme = "Catppuccin",
 
  colors = {
		indexed = {[16] = "#F8BD96", [17] = "#F5E0DC"},
		split = "#161320",
		visual_bell = "#302D41",
	},
  
  window_background_opacity = 0.92,

  window_decorations = "RESIZE",
  
  enable_tab_bar = false,

  scrollback_lines = 5000,

  enable_scroll_bar = false,
}
