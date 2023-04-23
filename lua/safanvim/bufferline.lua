local M = {
	"akinsho/bufferline.nvim",
        commit = "eb4e95b", -- this prevents updating
	enabled = true,
	event = "BufAdd",
	-- Keeps buffers and tabs scoped/separate
	dependencies = { "tiagovla/scope.nvim", config = true },
}
function M.config()
	local status_ok, bufferline = pcall(require, "bufferline")
	if not status_ok then
		return
	end

	--TODO: Take a look at the highlight groups. This config is a mess.

	bufferline.setup({
		options = {
			close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
			right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
			left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"

			indicator = {
				icon = "▎", -- this should be omitted if indicator style is not 'icon'
				style = "icon",
			},
			buffer_close_icon = "X",
			modified_icon = "*",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",

			diagnostics = "nvim_lsp",

			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "left",
					separator = true,
				},
			},

			color_icons = true, -- whether or not to add the filetype icon highlights
			show_buffer_icons = true, -- disable filetype icons for buffers
                        --options = {
                             --   get_element_icon = function(element)
		               -- return require('bufferline').get_element_icon(element.name, {default = false})
	               -- end
                       -- },
			show_buffer_close_icons = true,
			show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
			show_close_icon = false,
			show_tab_indicators = true,

			separator_style = "thin", --[[ | "thin" | { 'any', 'any' }, ]]
			always_show_bufferline = true, -- only show when two tabs up
			sort_by = "insert_at_end",
                },

		highlights = {
			--fill =
                --{
                        --fg = { attribute = "fg", highlight = "#ff0000" },
			--bg = { attribute = "bg", highlight = "#FFFFFF" },
               -- },
			--buffer_selected = {
			    --fg = { attribute = "fg", highlight = "#ff0000" },
			--},
			buffer_visible = {
				fg = { attribute = "fg", highlight = "Comment", italic = false }, -- doesn't seem to work
			},
			tab_selected = {
				fg = { attribute = "fg", highlight = "Normal" },
				bg = { attribute = "bg", highlight = "Normal" },
			},
			modified = {
				fg = { attribute = "fg", highlight = "Comment" },
			},
			modified_selected = {
				fg = { attribute = "fg", highlight = "Normal" },
			},
			modified_visible = {
			    bg = { attribute = "bg", highlight = "Normal" },
			},
			--
			separator = {
				fg = { attribute = "bg", highlight = "Normal" },
				bg = { attribute = "bg", highlight = "Normal" },
			},
			separator_selected = {
				fg = "#FFFFFF",
				bg =  "#FFFFFF",
			},
			separator_visible = {
				fg = "#FFFFFF",
				bg =  "#FFFFFF",
			},
			indicator_selected = {
				fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
				bg = { attribute = "bg", highlight = "Normal" },
			},
		},
	})
end
return M
