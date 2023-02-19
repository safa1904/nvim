function ColorMyPencils(color)
	color = color
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0,"Normal", {bg ="none"})--for the background seen through
	vim.api.nvim_set_hl(0,"NormalFloat", {bg ="none"})--for the background seen through


end
ColorMyPencils()
local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
