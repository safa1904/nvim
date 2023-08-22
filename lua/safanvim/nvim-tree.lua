-- import nvim-tree plugin safely
local M = {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
}
function M.config()
    local setup, nvimtree = pcall(require, "nvim-tree")
	if not setup then
		return
	end
    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
    nvimtree.setup({
    disable_netrw = false,
    hijack_directories = {
    enable = true,
  },
	view = {
      width = 30,--window size
    },
    filters = {
      custom = { ".git" },
    },
    sync_root_with_cwd = true,
    update_focused_file = {
	    enable = true,
	    update_root = true,
    },

    renderer = {
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
          },
          folder = {
            arrow_closed = "+",
	    arrow_open = "-",
          },
        },
      },
      indent_markers = {
        enable = false,
      },
	
    },
	
  })
  vim.notify = require("notify")

	vim.keymap.set("n", "<Leader>e", ":NvimTreeFindFileToggle<CR>")
end

return M
