----------------------------------------------------------------------------------------
-- LAZY
----------------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Leader Mapping (Required by Lazy)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

----------------------------------------------------------------------------------------
-- PLUGINS
----------------------------------------------------------------------------------------
local plugins = {
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'hrsh7th/cmp-nvim-lsp',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  'echasnovski/mini.pairs',
  'theprimeagen/harpoon',
  'mbbill/undotree',
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
    },
  {
    'tpope/vim-commentary',
    event = "VeryLazy" 
    },

  { 
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim' 
        }
    },

  { 
    'sainnhe/sonokai',
    lazy = true 
    },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
  },

  { 
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' 
        }
    },

  {
    "hrsh7th/nvim-cmp",
    event = 'VeryLazy',
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { 'BufRead', 'BufNewFile' },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
  },
}

-- Lazy Initialize
require("lazy").setup(plugins, {})

-- Lualine setup
require('lualine').setup {
  options = {
    theme = 'sonokai'
  }
}

