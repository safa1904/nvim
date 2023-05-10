local M = {
    "andweeb/presence.nvim",
    event = "BufReadPost",
}
function M.config()
    local status_ok, presence = pcall(require, "presence")
    if not status_ok then
        return
    end
    presence:setup({
        -- General options
        auto_update = true,
        neovim_image_text = "🧚safa's neovim",
        main_image = "file",
        client_id = "793271441293967371",
        log_level = nil,
        debounce_timeout = 10,
        enable_line_number = false,
        blacklist = {},
        buttons = false, -- this is for github repo
        file_assets = {},
        show_time = false,

        -- Rich Presence text options
        editing_text = "Editing %s",
        file_explorer_text = "Browsing %s",
        git_commit_text = "Committing changes",
        plugin_manager_text = "Managing plugins",
        reading_text = "Reading %s",
        workspace_text = "Working on %s",
        line_number_text = "Line %s out of %s",
    })
end

return M
