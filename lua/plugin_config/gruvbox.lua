function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0,"Normal", {bg ="none"})--for the background seen through
	vim.api.nvim_set_hl(0,"NormalFloat", {bg ="none"})--for the background seen through




end
ColorMyPencils()
