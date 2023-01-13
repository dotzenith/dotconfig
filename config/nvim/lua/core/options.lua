-- Some sane defaults
vim.opt.backup = false                         
vim.opt.clipboard = "unnamedplus"              
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0                       
vim.opt.fileencoding = "utf-8"                 
vim.opt.hlsearch = true                        
vim.opt.ignorecase = true                      
vim.opt.mouse = "a"                            
vim.opt.pumheight = 10                         
vim.opt.showmode = false                       
vim.opt.showtabline = 2                        
vim.opt.smartcase = true                       
vim.opt.splitbelow = true                      
vim.opt.splitright = true                      
vim.opt.swapfile = false                       
vim.opt.termguicolors = true                   
vim.opt.timeoutlen = 1000                      
vim.opt.undofile = true                        
vim.opt.updatetime = 300                       
vim.opt.writebackup = false                     
vim.opt.expandtab = true                       
vim.opt.shiftwidth = 2                         
vim.opt.tabstop = 2                            
vim.opt.signcolumn = "yes:1"                   
vim.opt.wrap = false                            
vim.opt.guifont = "monospace:h17"               
vim.opt.number = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.laststatus = 3
vim.opt.shortmess:append "c"
vim.opt.whichwrap:append("<,>,[,]")
vim.cmd [[set fillchars-=vert:\| | set fillchars+=vert:\ ]]
vim.cmd [[set fillchars+=eob:\ ]]

-- makes things faster I guess?
vim.g.loaded_gzip = false
vim.g.loaded_matchit = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_man = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false
