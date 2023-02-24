------------------------------------------------------------------
vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

vim.keymap.set('n', '<F5>', require 'dap'.continue)
vim.keymap.set('n', '<F10>', require 'dap'.step_over)
vim.keymap.set('n', '<F11>', require 'dap'.step_into)
vim.keymap.set('n', '<F12>', require 'dap'.step_out)
vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)

require('dapui').setup()
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
            -- command = "/Users/fen/.vscode/extensions/vadimcn.vscode-lldb-1.7.4/adapter/codelldb",
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

------------------------------------------------------------------

