local M = {
    "lunarvim/darkplus.nvim",
    lazy = false,
    priority = 1000,
}

function M.config()
    local colorscheme = "darkplus"

    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not status_ok then
        vim.notify("colorscheme " .. colorscheme .. " not found!")
        return
    end

    function ColorMyPencils(color)
        color = color or "darkplus"
        vim.cmd.colorscheme("darkplus")

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) --for the background seen through
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) --for the background seen through
    end

    ColorMyPencils()
    -- local links = {
    --     ['@lsp.type.namespace'] = '@namespace',
    --     ['@lsp.type.type'] = '@type',
    --     ['@lsp.type.class'] = '@type',
    --     ['@lsp.type.enum'] = '@type',
    --     ['@lsp.type.interface'] = '@type',
    --     ['@lsp.type.struct'] = '@structure',
    --     ['@lsp.type.parameter'] = '@parameter',
    --     ['@lsp.type.variable'] = '@variable',
    --     ['@lsp.type.property'] = '@property',
    --     ['@lsp.type.enumMember'] = '@constant',
    --     ['@lsp.type.function'] = '@function',
    --     ['@lsp.type.method'] = '@method',
    --     ['@lsp.type.macro'] = '@macro',
    --     ['@lsp.type.decorator'] = '@function',
    -- }
    -- for newgroup, oldgroup in pairs(links) do
    --     vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
    -- end
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, group, {})
end
    --client.server_capabilities.semanticTokensProvider = nil
end

return M
