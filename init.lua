
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
vim.opt.termguicolors = true
vim.g.sonokai_style = 'atlantis'
vim.g.sonokai_better_performance = 1 
vim.cmd("colorscheme sonokai")
