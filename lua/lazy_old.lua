local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	--calling packer
	"wbthomason/packer.nvim",
	"ellisonleao/gruvbox.nvim",
	--"draclula/vim",
	-- those for tree
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",

	-- this for lua line
	"nvim-lualine/lualine.nvim",

	-- Bufferline
	"akinsho/bufferline.nvim",

	-- this for treesitter
	"nvim-treesitter/nvim-treesitter",
	--{ build = ":TSUpdate" },
	"p00f/nvim-ts-rainbow",

	"nvim-treesitter/playground",
	"nvim-treesitter/nvim-treesitter-context",
	"JoosepAlviste/nvim-ts-context-commentstring",

	-- for undotree to see your update
	"mbbill/undotree",

	-- dont remember what was those for :<
	"tpope/vim-fugitive",
	"bluz71/vim-nightfly-colors",
	"vim-test/vim-test",

	-- that's for mini terminal
	"akinsho/toggleterm.nvim",

	-- Colorschemes
	"lunarvim/darkplus.nvim",

	-- Comment
	"numToStr/Comment.nvim", -- Comment anywhere anything

	-- dashboard for some reason is not working
	"goolord/alpha-nvim",

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	"windwp/nvim-ts-autotag",
	--after= "nvim-treesitter", -- autoclose tags

	-- that's the thing come up with packer

	--"VonHeikemen/lsp-zero.nvim",
	--	branch = "v1.x",
	--	dependencies =
	-- LSP Support
	"neovim/nvim-lspconfig", -- Required
	"nvim-lua/completion-nvim",
	"williamboman/mason.nvim", -- Optional
	"williamboman/mason-lspconfig.nvim", -- Optional
	"glepnir/lspsaga.nvim",

	-- Autocompletion
	"hrsh7th/nvim-cmp", -- Required
	"hrsh7th/cmp-nvim-lsp", -- Required
	--"hrsh7th/cmp-buffer", -- Optional
	--"hrsh7th/cmp-path", -- Optional
	"saadparwaiz1/cmp_luasnip", -- Optional
	--"hrsh7th/cmp-nvim-lua" , -- Optional

	-- Snippets
	"L3MON4D3/LuaSnip", -- Required
	"rafamadriz/friendly-snippets", -- Optional

	-- Git
	"lewis6991/gitsigns.nvim",

	--presence this is not working with WSL2 :(
	"andweeb/presence.nvim",

	-- Project Directory AutoMove
	"ahmedkhalf/project.nvim",

	-- Which-Key
	"folke/which-key.nvim",

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

	--Debugging

	"mfussenegger/nvim-dap",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/nvim-dap-ui",
	"nvim-telescope/telescope-dap.nvim",
	"leoluz/nvim-dap-go",
	"jay-babu/mason-nvim-dap.nvim",

	-- for spaces checks
	"lukas-reineke/indent-blankline.nvim",

	--telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
}
local opts = {}
require("lazy").setup(plugins, opts)
