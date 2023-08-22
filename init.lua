
-- Config
require("plugins")
require("keybindings")
require("lsp")

-- Plugin configs
require("plugins.treesitter")
require("plugins.cmp")
require("plugins.telescope")
require("plugins.gitsigns")
require("plugins.autopairs")
-- Relative Numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Mouse Mode
vim.o.mouse ='a'

-- Save Undo History
vim.opt.undofile = true

-- Case Insensitive Searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Color Scheme
vim.cmd("colorscheme carbonfox")
vim.g.lightline = { colorscheme = "carbonfox" }

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

