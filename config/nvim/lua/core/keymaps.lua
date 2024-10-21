local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Resize with arrows
keymap("n", "<m-Up>", ":resize -2<CR>", opts)
keymap("n", "<m-Down>", ":resize +2<CR>", opts)
keymap("n", "<m-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<m-Right>", ":vertical resize +2<CR>", opts)

-- Movement
keymap("n", "<S-j>", "<cmd>lua require('neoscroll').scroll(vim.wo.scroll, 'true', '200')<cr>", opts)
keymap("n", "<S-k>", "<cmd>lua require('neoscroll').scroll(-vim.wo.scroll, 'true', '200')<cr>", opts)

-- Harpoon
keymap("n", "<m-k>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)
keymap("n", "<m-j>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)
keymap("n", "<leader>H", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "<leader><tab>", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)

-- Navigate buffers
keymap("n", "<leader><Backspace>", ":Bdelete! %<CR>", opts)

-- Splits
keymap("n", "<Up>", "<c-w>k", opts)
keymap("n", "<Down>", "<c-w>j", opts)
keymap("n", "<Left>", "<c-w>h", opts)
keymap("n", "<Right>", "<c-w>l", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Custom
keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>", opts)
keymap("n", "<leader>fc", ":Format<cr>", opts)
keymap('n', '<leader>o', '<cmd>Outline<CR>', opts)

-- Easier start of line and end of line
keymap("", "H", "0", opts)
keymap("", "L", "$", opts)

-- Annoying history mode
keymap("n", "q:", "<Nop>", opts)
keymap("n", "Q", "<Nop>", opts)
