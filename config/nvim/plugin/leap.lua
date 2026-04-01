vim.pack.add({
  { src = 'https://github.com/tpope/vim-repeat',         version = '65846025c15494983dafe5e3b46c8f88ab2e9635' },
  { src = 'https://codeberg.org/andyg/leap.nvim.git',    version = 'af1dedf49efe203b98c65970a6bb652af256b882' },
})

local opts = { noremap = true, silent = true }
vim.keymap.set({'n', 'o'}, 's',  '<Plug>(leap-forward)', opts)
vim.keymap.set({'n', 'o'}, 'S',  '<Plug>(leap-backward)', opts)
