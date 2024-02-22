local M = {
    "goolord/alpha-nvim",
    event = 'VimEnter',
}

function M.config()
    local present, alpha = pcall(require, "alpha")

    if not present then
        return
    end

    local function button(sc, txt, keybind)
        local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

        local opts = {
            position = "center",
            text = txt,
            shortcut = sc,
            cursor = 5,
            width = 36,
            align_shortcut = "right",
            hl = "AlphaButtons",
            hl_shortcut = "TSNumber",
        }

        if keybind then
            opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
        end

        return {
            type = "button",
            val = txt,
            on_press = function()
                local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
                vim.api.nvim_feedkeys(key, "normal", false)
            end,
            opts = opts,
        }
    end



    -- dynamic header padding
    local fn = vim.fn
    local marginTopPercent = 0.05
    local headerPadding = fn.max({ 2, fn.floor(fn.winheight(0) * marginTopPercent) })

    local icons = require("utils.icons")
    local daylight = require("utils.functions").daylight()
    if daylight then
        header_hl_group = "string"
    else
        header_hl_group = "TSLabel" -- deep blue
    end

    local function dynamic_header()
        local val = {
[[             __                 _           ]],
[[            / _|               (_)          ]],
[[  ___  __ _| |_ __ _ _ ____   ___ _ __ ___  ]],
[[ / __|/ _` |  _/ _` | '_ \ \ / / | '_ ` _ \ ]],
[[ \__ \ (_| | || (_| | | | \ V /| | | | | | |]],
[[ |___/\__,_|_| \__,_|_| |_|\_/ |_|_| |_| |_|]]
        }


        return val
    end
    require("alpha.term")

    local dynamic_header_responsive = {
        type = "text",
        val = dynamic_header,
        opts = {
            position = "center",
            hl = header_hl_group,
        },
    }


    local options = {
        header = dynamic_header_responsive,

        buttons = {
            type = "group",
            val = {

                button("n", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
                button("r", icons.ui.History .. " Recent Files", ":Telescope oldfiles <CR>"),
                button("f", icons.documents.Files .. " Find Files", ":Telescope find_files <CR>"),
                button("c", icons.ui.Gear .. " Configuration", ":e $MYVIMRC | :cd %:p:h <CR>"),
                button("u", icons.ui.CloudDownload .. " Update", ":Lazy update<CR>"),
                button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
            },
            opts = {
                spacing = 1,
                type ="text",
                            },
        },
        footer = {
            type = "text",
            val = require("alpha.fortune")(),
            opts = { hl = "comment", position = "center" },
        },

        headerPaddingTop = { type = "padding", val = headerPadding },
        headerPaddingBottom = { type = "padding", val = 2 },
    }

    alpha.setup({
        layout = {
            options.headerPaddingTop,
            options.header,
            options.headerPaddingBottom,
            options.buttons,
            options.footer,
        },
        opts = {},
    })

    -- Disable statusline in dashboard
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "alpha",
        callback = function()
            -- store current statusline value and use that
            local old_laststatus = vim.opt.laststatus
            vim.api.nvim_create_autocmd("BufUnload", {
                buffer = 0,
                callback = function()
                    vim.opt.laststatus = old_laststatus
                end,
            })
            vim.opt.laststatus = 0
        end,
    })
end

return M
