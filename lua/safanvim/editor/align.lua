local M = {}

function M.config()
    local present, align = pcall(require, "mini.align")
    if not present then
        return
    end
    -- No need to copy this inside `setup()`. Will be used automatically.
    align.setup({
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            start = "ga",
            start_with_preview = "gA",
        },

        -- Default options controlling alignment process
        options = {
            split_pattern = "",
            justify_side = "left",
            merge_delimiter = "",
        },

        -- Default steps performing alignment (if `nil`, default is used)
        steps = {
            merge = nil,
            pre_split = {},
            split = nil,
            pre_justify = {},
            justify = nil,
            pre_merge = {},
        },
    })
end

return M
