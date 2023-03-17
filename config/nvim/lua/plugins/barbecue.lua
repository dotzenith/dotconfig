local status_ok, barbecue = pcall(require, "barbecue")
if not status_ok then
	return
end

barbecue.setup {
  theme = "catppuccin",
  exclude_filetypes = { "gitcommit", "toggleterm", "NvimTree", "alpha", "sshconfig", "exports", "" },
  show_dirname = false,
}
