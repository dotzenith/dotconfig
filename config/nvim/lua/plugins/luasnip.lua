-- If luasnip stil acts funky, check: 
-- https://www.reddit.com/r/neovim/comments/yiimig/cmp_luasnip_jump_points_strange_behaviour/

local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
	return
end

luasnip.setup {
  region_check_events = 'InsertEnter',
  delete_check_events = 'InsertLeave',
}
