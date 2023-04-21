local wezterm = require 'wezterm';

return {

  font = wezterm.font("JetBrainsMono Nerd Font", {weight="Medium", stretch="Normal", style="Normal"}),  

  font_rules = {
    {
      italic = true,
      font = wezterm.font("JetBrainsMono Nerd Font", {weight="Medium", stretch="Normal", style="Italic"}), 
    },
    {
      intensity = "Bold",
      font = wezterm.font("JetBrainsMono Nerd Font", {weight="Bold", stretch="Normal", style="Normal"}),
    },
    {
      intensity = "Bold",
      italic = true,
      font = wezterm.font("JetBrainsMono Nerd Font", {weight="Bold", stretch="Normal", style="Italic"})
    },
  },
  
  font_size = 18.0,
  
  color_scheme = "Catppuccin",
 
  colors = {
		indexed = {[16] = "#F8BD96", [17] = "#F5E0DC"},
		split = "#161320",
		visual_bell = "#302D41",
	},
  window_padding = {
    left = 15,
    right = 15,
    top = 10,
    bottom = 0,
  },
  
  window_background_opacity = 0.92,
  window_decorations = "RESIZE",
  enable_tab_bar = false,
  scrollback_lines = 5000,
  enable_scroll_bar = false,
  check_for_updates = false,
}

