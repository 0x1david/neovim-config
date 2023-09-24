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
  'windwp/nvim-autopairs',
  'L3MON4D3/LuaSnip',
  'theprimeagen/harpoon',
  'mbbill/undotree',
{
        'rust-lang/rust.vim',
        ft = 'rust',
        init = function ()
         vim.g.rustfmt_autosave = 1
        end
    },
  {  
    'simrat39/rust-tools.nvim',
    event = "VeryLazy"
    },
  {
    'altermo/ultimate-autopair.nvim',
    event={'InsertEnter','CmdlineEnter'},
    branch='v0.6',
    opts={
     },
    },
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
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        { "s", mode = { "n", "o", "x" }, function() require("flash").jump(
        ) end, desc = "Flash" },
        -- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        -- { "<c-f>", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        -- { "<c-sss>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
     },
   }
}

-- Lazy Initialize
require("lazy").setup(plugins, {})

-- Lualine setup
require('lualine').setup {
  options = {
    theme = 'sonokai'
  }
}

