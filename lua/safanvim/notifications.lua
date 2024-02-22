local M = {
"rcarriga/nvim-notify"

}

function M.config()
    local status_ok, notify = pcall(require, "notify")
    if status_ok then
        notify.setup({
            background_colour = "#282C34",
            fps = 30,
            icons = {
                DEBUG = "",
                ERROR = "",
                INFO = "",
                TRACE = "✎",
                WARN = "",
            },
            level = 2,
            minimum_width = 50,
            render = "default",
            stages = "fade_in_slide_out",
            time_formats = {
                notification = "%T",
                notification_history = "%FT%T",
            },
            timeout = 5000,
            top_down = true,
        })
        vim.notify = require("notify")
        return
    end
end

return M
