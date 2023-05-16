local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  return
end

neoscroll.setup {
  -- All these keys will be mapped to their corresponding default scrolling animation
  hide_cursor = true, -- Hide cursor while scrolling
  stop_eof = true, -- Stop at <EOF> when scrolling downwards
  use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
  respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing_function = "quadratic", -- Default easing function
  pre_hook = nil, -- Function to run before the scrolling animation starts
  post_hook = nil, -- Function to run after the scrolling animation ends
}

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<S-h>'] = {'scroll', {'-vim.wo.scroll', 'true', '350', [['quadratic']]}}
t['<S-l>'] = {'scroll', { 'vim.wo.scroll', 'true', '350', [['quadratic']]}}
-- When no easing function is provided the default easing function (in this case "quadratic") will be used
t['zt']    = {'zt', {'300'}}
t['zz']    = {'zz', {'300'}}
t['zb']    = {'zb', {'300'}}

require("neoscroll.config").set_mappings(t)
