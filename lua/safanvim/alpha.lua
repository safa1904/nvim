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
        -- header_hl_group = "Error" -- RED
    end

    local function dynamic_header() --TODO: Tweak this and fix the height/width conditions later.
        --local uis = vim.api.nvim_list_uis()[1]
        local val = { --Defaults

            [[  /$$$$$$             /$$$$$$         /$$              /$$   /$$                                /$$              ]],
            [[ /$$__  $$           /$$__  $$       | $/             | $$$ | $$                               |__/              ]],
            [[| $$  \__/  /$$$$$$ | $$  \__//$$$$$$|_//$$$$$$$      | $$$$| $$  /$$$$$$   /$$$$$$  /$$    /$$ /$$ /$$$$$$/$$$$ ]],
            [[|  $$$$$$  |____  $$| $$$$   |____  $$ /$$_____/      | $$ $$ $$ /$$__  $$ /$$__  $$|  $$  /$$/| $$| $$_  $$_  $$]],
            [[ \____  $$  /$$$$$$$| $$_/    /$$$$$$$|  $$$$$$       | $$  $$$$| $$$$$$$$| $$  \ $$ \  $$/$$/ | $$| $$ \ $$ \ $$]],
            [[ /$$  \ $$ /$$__  $$| $$     /$$__  $$ \____  $$      | $$\  $$$| $$_____/| $$  | $$  \  $$$/  | $$| $$ | $$ | $$]],
            [[|  $$$$$$/|  $$$$$$$| $$    |  $$$$$$$ /$$$$$$$/      | $$ \  $$|  $$$$$$$|  $$$$$$/   \  $/   | $$| $$ | $$ | $$]],
            [[ \______/  \_______/|__/     \_______/|_______/       |__/  \__/ \_______/ \______/     \_/    |__/|__/ |__/ |__/]],
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
            },
        },
        footer = {
            type = "text",
            val = require("alpha.fortune")(),
            opts = { hl = "Comment", position = "center" },
        },

        headerPaddingTop = { type = "padding", val = headerPadding },
        headerPaddingBottom = { type = "padding", val = 2 },
    }

    local function getGreeting(name)
        local tableTime = os.date("*t")
        local hour = tableTime.hour
        local greetingsTable = {
            [1] = "  Sleep well",
            [2] = "  Good morning",
            [3] = "  Good afternoon",
            [4] = "  Good evening",
            [5] = "望 Good night",
        }
        local greetingIndex = 0
        if hour == 23 or hour < 7 then
            greetingIndex = 1
        elseif hour < 12 then
            greetingIndex = 2
        elseif hour >= 12 and hour < 18 then
            greetingIndex = 3
        elseif hour >= 18 and hour < 21 then
            greetingIndex = 4
        elseif hour >= 21 then
            greetingIndex = 5
        end
        return greetingsTable[greetingIndex] .. ", " .. name
    end
   vim.notify = require("notify")(getGreeting("Saphia"), "info",
           {title = "Greetings", stages = "slide", render = "minimal"})

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
