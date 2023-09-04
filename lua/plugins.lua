----------------------------------------------------------------------------------------
-- PACKER
----------------------------------------------------------------------------------------
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)
----------------------------------------------------------------------------------------
-- PLUGINS
----------------------------------------------------------------------------------------
local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary' 
  use 'tpope/vim-surround' 
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = {
		  'nvim-lua/plenary.nvim' 
	  } }
  use "sainnhe/sonokai"
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
       }
  use {
	  'lewis6991/gitsigns.nvim',
	  requires = {
		  'nvim-lua/plenary.nvim' } }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
  use 'neovim/nvim-lspconfig' 
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use {
      'echasnovski/mini.pairs',
}
  -- use {
	-- "windwp/nvim-autopairs",
  --   config = function() require("nvim-autopairs").setup {} end
-- }
end)

require('lualine').setup {
        options = {
        theme = 'sonokai'
          }
        }
--require('mini.nvim').setup()
