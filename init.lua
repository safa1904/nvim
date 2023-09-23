----------------------------------------------[[ Bootstrap Lazy ]]

require("lazy_bootstrap") -- bootstraps folke/lazy


----------------------------------------------[[  User Settings ]]

require("config") -- loads lua/user/init.lua

----------------------------------------------[[  Load Plugins  ]]


require("lazy").setup("safanvim", {
	checker = { enabled = false },
	diff = { cmd = "diffview.nvim" },
	ui = { border = "rounded" },
	change_detection = { enabled = false },
})
