-- Some sane defaults
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.fileencoding = "utf-8"
vim.opt.signcolumn = "yes:1"
vim.opt.guifont = "monospace:h17"
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.magic = true
vim.opt.conceallevel = 0
vim.opt.hlsearch = true
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.wrap = false
vim.opt.number = true
vim.opt.laststatus = 3

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true

vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.timeoutlen = 1000
vim.opt.updatetime = 100

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.linebreak = true
vim.opt.whichwrap = 'h,l,<,>,[,],~'
vim.opt.breakindentopt = 'shift:2,min:20'
vim.wo.showbreak = 'NONE'

vim.opt.shortmess:append "c"
vim.opt.whichwrap:append("<,>,[,]")
vim.cmd [[set fillchars-=vert:\| | set fillchars+=vert:\ ]]
vim.cmd [[set fillchars+=eob:\ ]]

if vim.fn.executable('rg') == 1 then
  vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
  vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
end

-- Deno
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

-- makes things faster I guess?
vim.g.loaded_gzip = false
vim.g.loaded_matchit = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_man = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false
