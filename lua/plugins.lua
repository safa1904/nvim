local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	--calling packer
	use("wbthomason/packer.nvim")

	-- those for tree
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")

	-- this for lua line
	use("nvim-lualine/lualine.nvim")

	-- Bufferline
	use("akinsho/bufferline.nvim")

	-- this for treesitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")
	use("nvim-treesitter/nvim-treesitter-context")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- for undotree to see your update
	use("mbbill/undotree")

	-- dont remember what was those for :<
	use("tpope/vim-fugitive")
	use("bluz71/vim-nightfly-colors")
	use("vim-test/vim-test")

	-- that's for mini terminal
	use({ "akinsho/toggleterm.nvim" })

	--telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- Colorschemes
	use("lunarvim/darkplus.nvim")

	-- Comment
	use("numToStr/Comment.nvim") -- Comment anywhere anything

	-- dashboard for some reason is not working
	use("goolord/alpha-nvim")

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- that's the thing come up with packer
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "nvim-lua/completion-nvim" },
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	})
	-- Git
	use({ "lewis6991/gitsigns.nvim" })

	--presence this is not working with WSL2 :(
	use({ "andweeb/presence.nvim" })

	-- Project Directory AutoMove
	use("ahmedkhalf/project.nvim")

	-- Which-Key
	use("folke/which-key.nvim")

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	--Debugging
	use({
		"mfussenegger/nvim-dap",
		"theHamsta/nvim-dap-virtual-text",
		"rcarriga/nvim-dap-ui",
		"nvim-telescope/telescope-dap.nvim",
		"leoluz/nvim-dap-go",
		"jay-babu/mason-nvim-dap.nvim",
	})
	-- for spaces checks
	use("lukas-reineke/indent-blankline.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
