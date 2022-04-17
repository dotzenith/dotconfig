local status_ok, cp = pcall(require, "catppuccin.core.color_palette")
if not status_ok then
	return
end


local M = {}
M.theme = function()

    -- I know I could just set bg = nil but I'm leaving this here in case I want custom colors in the future
    local colors = {
          nobg = nil,
    }
    return {
        inactive = {
            a = { fg = cp.blue, bg = colors.nobg, gui = "bold" },
            b = { fg = cp.black4, bg = colors.nobg },
            c = { fg = cp.gray0, bg = colors.nobg },
        },
        visual = {
            a = { fg = cp.black2, bg = cp.mauve, gui = "bold" },
            b = { fg = cp.mauve, bg = colors.nobg },
            c = { fg = cp.white, bg = colors.nobg },
        },
        replace = {
            a = { fg = cp.black2, bg = cp.red, gui = "bold" },
            b = { fg = cp.red, bg = colors.nobg },
            c = { fg = cp.white, bg = colors.nobg },
        },
        normal = {
            a = { fg = cp.black1, bg = cp.blue, gui = "bold" },
            b = { fg = cp.blue, bg = colors.nobg },
            c = { fg = cp.white, bg = colors.nobg },
        },
        insert = {
            a = { fg = cp.black2, bg = cp.green, gui = "bold" },
            b = { fg = cp.teal, bg = cp.nobg },
            c = { fg = cp.white, bg = colors.nobg },
        },
        command = {
            a = { fg = cp.black2, bg = cp.peach, gui = "bold" },
            b = { fg = cp.peach, bg = cp.nobg },
            c = { fg = cp.white, bg = colors.nobg },
        },
    }
end
return M
