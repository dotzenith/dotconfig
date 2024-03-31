local autocmd = vim.api.nvim_create_autocmd

autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]])
	end,
})

-- Highlight yanked text
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 100 }
  end,
})

-- Enable spellchecking in markdown, text and gitcommit files
autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "text", "tex" },
  callback = function()
		vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Typst
autocmd({ "BufNewFile", "BufRead" }, {
   pattern = "*.typ",
   callback = function()
    vim.opt.filetype = "typst"
   end,
})


-- Relative Numbers
autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
   pattern = "*",
   callback = function()
      if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
         vim.opt.relativenumber = true
      end
   end,
})

autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
   pattern = "*",
   callback = function()
      if vim.o.nu then
         vim.opt.relativenumber = false
         vim.cmd "redraw"
      end
   end,
})
