local M = {
'rcarriga/nvim-notify',
 event= "VimEnter",
}
function M.config()
    vim.notify = require("notify")

    require("notify").setup({
        stages = "slide",
        render = "compact",
        fps = 120,
    })

   end

return M
