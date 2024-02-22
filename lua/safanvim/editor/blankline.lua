local M = {
	"lukas-reineke/indent-blankline.nvim",
}
function M.config()
	vim.opt.list = true

	vim.opt.listchars:append("trail:⋅")
	vim.opt.listchars:append("space: ")

    require("ibl").setup({
        scope = { show_start = false, show_end = false },
        indent = {
            char = "│",
        },
    })
end
return M
