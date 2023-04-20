local M = {
	"mfussenegger/nvim-dap",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/nvim-dap-ui",
	"nvim-telescope/telescope-dap.nvim",
	"leoluz/nvim-dap-go",
	"jay-babu/mason-nvim-dap.nvim",
}
function M.config()
	vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

	vim.keymap.set("n", "<F5>", require("dap").continue)
	vim.keymap.set("n", "<F10>", require("dap").step_over)
	vim.keymap.set("n", "<F11>", require("dap").step_into)
	vim.keymap.set("n", "<F12>", require("dap").step_out)
	vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)

	-- dapui.setup()
	require("dapui").setup({
		icons = { expanded = "", collapsed = "", circular = "" },
		mappings = {
			-- Use a table to apply multiple mappings
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		-- Expand lines larger than the window
		-- Requires >= 0.7
		expand_lines = vim.fn.has("nvim-0.7"),
		-- Layouts define sections of the screen to place windows.
		-- The position can be "left", "right", "top" or "bottom".
		-- The size specifies the height/width depending on position. It can be an Int
		-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
		-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
		-- Elements are the elements shown in the layout (in order).
		-- Layouts are opened in order so that earlier layouts take priority in window sizing.
		layouts = {
			{
				elements = {
					-- Elements can be strings or table with id and size keys.
					{ id = "scopes", size = 0.25 },
					"breakpoints",
					-- "stacks",
					-- "watches",
				},
				size = 40, -- 40 columns
				position = "left",
			},
			{
				elements = {
					"repl",
					"console",
				},
				size = 0.25, -- 25% of total lines
				position = "bottom",
			},
		},
		floating = {
			max_height = nil, -- These can be integers or a float between 0 and 1.
			max_width = nil, -- Floats will be treated as percentage of your screen.
			border = "single", -- Border style. Can be "single", "double" or "rounded"
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		windows = { indent = 1 },
		render = {
			max_type_length = nil, -- Can be integer or nil.
		},
	})
	require("mason-nvim-dap").setup({
		ensure_installed = {
			"codelldb",
		},
		automatic_setup = true,
	})
	local dap_status_ok, dap = pcall(require, "dap")
	if not dap_status_ok then
		return
	end

	dap.adapters.codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			command = "codelldb",
			args = { "--port", "${port}" },
		},
	}

	dap.configurations.c = {
		{
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			terminal = "integrated",
		},
	}
end
return M
------------------------------------------------------------------
