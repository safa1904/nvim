local M = {
	"nvim-lualine/lualine.nvim",
}
function M.config()
	local wordcount = {
		"words",
		cond = function()
			local ft = vim.opt_local.filetype:get()
			local count = {
				latex = true,
				tex = true,
				text = true,
				txt = true,
				markdown = true,
				vimwiki = true,
				neorg = true,
				c = true,
				python = true,
				lua = true,
			}
			return count[ft] ~= nil
		end,
		fmt = function()
			local words = vim.fn.wordcount()["words"]
			return "Words: " .. words
		end,
	}

	require("lualine").setup({
		options = {
			icons_enabled = true,
			--theme = 'gruvbox',
		},
		sections = {
			lualine_a = {
				{
					"filename",
					path = 1,
				},
			},
		},
		lualine_y = { wordcount },
	})
end
return M
