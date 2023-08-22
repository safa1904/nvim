local M = {}

function M.post()
    local base_stages = require("notify.stages.slide")("bottom_up")
    local notify = require("notify")

    notify.setup({
      render = "compact",
      stages = {
        function(...)
          local opts = base_stages[1](...)
          if not opts then
            return
          end
          return opts
        end,
        unpack(base_stages, 2),
      },
      background_colour = "#121212",
      max_width = 120,
    })

    vim.api.nvim_set_keymap("n", "<leader>p", "", { callback = notify.dismiss })
end

return M
-- local M = {
-- 'rcarriga/nvim-notify',
--  event= "VimEnter",
-- }
-- local icons = require "utils.icons"
-- function M.setup()
--   vim.notify = require "notify".setup {
--     icons = {
--       ERROR = icons.diagnostics.Error,
--       WARN = icons.diagnostics.Warning,
--       INFO = icons.diagnostics.Information,
--       DEBUG = icons.ui.Bug,
--       TRACE = icons.ui.Pencil,
--       stages = "slide",
--       render = "compact",
--       fps = 120,
--
--     },
--   }
--  -- function M.config()
-- --     vim.notify = require("notify")
-- --
-- --     require("notify").setup({
-- ----     })
--
--    end
--
-- return M
