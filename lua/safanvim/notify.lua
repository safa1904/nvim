local M = {
'rcarriga/nvim-notify',
 event= "VimEnter",
}
function M.config()
    vim.notify = require("notify")
    local icons = require "utils.icons"

    require("notify").setup({
        stages = "slide",
        render = "compact",
        fps = 120,
    icons = {
    ERROR = icons.diagnostics.Error,
    WARN = icons.diagnostics.Warning,
    INFO = icons.diagnostics.Information,
    DEBUG = icons.ui.Bug,
    TRACE = icons.ui.Pencil,
  },

    })
end
return M
