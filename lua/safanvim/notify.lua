local M = {
'rcarriga/nvim-notify',
 event= "VimEnter",
}
local icons = require "utils.icons"
function M.setup()
  vim.notify = require "notify".setup {
    icons = {
      ERROR = icons.diagnostics.Error,
      WARN = icons.diagnostics.Warning,
      INFO = icons.diagnostics.Information,
      DEBUG = icons.ui.Bug,
      TRACE = icons.ui.Pencil,
      stages = "slide",
      render = "compact",
      fps = 120,

    },
  }
 -- function M.config()
--     vim.notify = require("notify")
--
--     require("notify").setup({
----     })

   end

return M
