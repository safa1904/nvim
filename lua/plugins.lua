local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
 -- use 'ellisonleao/gruvbox.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use ('nvim-treesitter/nvim-treesitter',{ run = ':TSUpdate'})
  use ('nvim-treesitter/playground')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use 'bluz71/vim-nightfly-colors'
  use 'vim-test/vim-test'
  --commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }
  use { "akinsho/toggleterm.nvim"}
 --[ use {
--	  "williamboman/mason.nvim",
--	  "williamboman/mason-lspconfig.nvim",
--	  "neovim/nvim-lspconfig",
 -- }

  use {
	  'nvim-telescope/telescope.nvim' ,
	  tag = '0.1.0' ,
	  requires ={ {'nvim-lua/plenary.nvim'} }
  }
  use ({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
})
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
}
-- Git
	use { "lewis6991/gitsigns.nvim"}
    --commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2" }
  --git staff
  --["lewis6991/gitsigns.nvim"] = {
    --ft = "gitcommit",
    --setup = function()
      --require("core.lazy_load").gitsigns()
    --end,
    --config = function()
      --require("plugins.configs.others").gitsigns()
    --end,
  --}
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
