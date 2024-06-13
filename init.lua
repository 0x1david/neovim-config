-- Config
require("plugins")
require("neodev").setup({})
require("keybindings")
require("lsp")

-- Plugin configs
require("plugins.treesitter")
require("plugins.dap")
require("plugins.cmp")
require("plugins.telescope")
require("plugins.gitsigns")
require("plugins.harpoon")
require("plugins.undotree")
require("plugins.toggleterm")
require("plugins.zen")
require("plugins.oil")


-- Indent Size
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Relative Numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Mouse Mode
vim.o.mouse ='a'

-- Yank to System Clipboard
vim.opt.clipboard = "unnamedplus"

-- Case Insensitive Searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Color Scheme
vim.opt.termguicolors = true
vim.g.sonokai_style = 'atlantis'
vim.g.sonokai_better_performance = 1
vim.cmd("colorscheme sonokai")

-- Replace Swap Files With UndoTree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search Highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- QOL
vim.opt.wrap = false -- Linewrap
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
