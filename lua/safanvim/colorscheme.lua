-- purpose: for colorscheme
local M = {
    "lunarvim/darkplus.nvim",
    lazy = false,
    priority = 1000,
}

function M.config()
    local colorscheme = "darkplus"

    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not status_ok then
        return
    end

    function ColorMyPencils(color)
        color = color or "darkplus"
        vim.cmd.colorscheme("darkplus")

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) --for the background seen through
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) --for the background seen through
    end

    ColorMyPencils()
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        vim.api.nvim_set_hl(0, group, {})
    end
end
return M
