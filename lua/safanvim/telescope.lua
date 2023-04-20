local M = {
	"nvim-telescope/telescope.nvim",
	version = "0.1.0",
	dependencies = { { "nvim-lua/plenary.nvim" } },
}

function M.config()
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
	vim.keymap.set("n", "<C-p>", builtin.git_files, {})
	vim.keymap.set("n", "<leader>ps", function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
	end) --This above three setup from the video that fen told me about it.
	vim.keymap.set("n", "<Space><Space>", builtin.oldfiles, {})
	vim.keymap.set("n", "<Space>fg", builtin.live_grep, {})
	vim.keymap.set("n", "<Space>fh", builtin.help_tags, {})
end

return M
