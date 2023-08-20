local M = {
    "goolord/alpha-nvim",
    event = 'VimEnter',
    --dependencies = { {'rcarriga/nvim-notify'}}
}

function M.config()
    local present, alpha = pcall(require, "alpha")

    if not present then
        return
    end

    -- d t g
    local function button(sc, txt, keybind)
        local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

        -- delete inside {
        -- d i {
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

    -- ┌────────────────────────┐
    -- │          |             │
    -- │          |   .         │
    -- │   `.  *  |     .'      │
    -- │     `. ._|_* .'  .     │
    -- │   . * .'   `.  *       │
    ---│ ------|     |-------   │
    -- │   .  *`.___.' *  .     │
    -- │      .'  |* `.  *      │
    -- │    .' *  |  . `.       │
    -- │        . |             │
    -- │          | jgs         │
    -- └────────────────────────┘



    local function dynamic_header() --TODO: Tweak this and fix the height/width conditions later.
        local uis = vim.api.nvim_list_uis()[1]
        local height = uis.height
        local width = uis.width
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



        if width > 88 and height > 36 and not daylight then
            val = {
                [[┌────────────────────────────────────────────────────────────────────────────────────────┐]],
                [[│           ____                                                                         │]],
                [[│       _.-'78o `"`--._                                                                  │]],
                [[│   ,o888o.  .o888o,   ''-.                                                              │]],
                [[│ ,88888P  `78888P..______.]                                                             │]],
                [[│/_..__..----""        __.'                                                              │]],
                [[│`-._       /""| _..-''                                                                  │]],
                [[│    "`-----\  `\                                                                        │]],
                [[│            |   ;.-""--..                                                               │]],
                [[│            | ,8o.  o88. `.     ,d8888b                           d8,                   │]],
                [[│            `;888P  `788P  :    88P`                             `8P                    │]],
                [[│      .o""-.|`-._         ./  d888888P`                                                 │]],
                [[│     J88 _.-/    ";"-P----'    ?88`  d8888b  88bd88b  ?88   d8P  88b  88bd8b,d88b       │]],
                [[│     `--'\`|     /  /          88P   d8b_,dP  88P` ?8b d88  d8P` 88P  88P``?8P`?8b      │]],
                [[│         | /     |  |          d88   88b     d88   88P ?8b ,88`  d88  d88  d88  88P     │]],
                [[│         \|     /   |         d88`   `?888P`d88`   88b `?888P`   d88` d88` d88`  88b    │]],
                [[│          `-----`---'-----===---======-----=---====---==-----===---==---==---===---=    │]],
                [[└────────────────────────────────────────────────────────────────────────────────────────┘]],
            }
        elseif width > 88 and height > 36 and daylight then
            val = {
                [[┌────────────────────────────────────────────────────────────────────────────────────────┐]],
                [[│           ____                                                                         │]],
                [[│       _.-'78o `"`--._                                                                  │]],
                [[│   ,o888o.  .o888o,   ''-.                                                              │]],
                [[│ ,88888P  `78888P..______.]                                                             │]],
                [[│/_..__..----""        __.'                                                              │]],
                [[│`-._       /""| _..-''                                                                  │]],
                [[│    "`-----\  `\                                                                        │]],
                [[│            |   ;.-""--..        ,...                          ,,                       │]],
                [[│            | ,8o.  o88. `.    .d' ""            `7MMF'   `7MF'db                       │]],
                [[│            `;888P  `788P  :   dM`                 `MA     ,V                           │]],
                [[│      .o""-.|`-._         ./  mMMmm.gP"Ya `7MMpMMMb.VM:   ,V `7MM  `7MMpMMMb.pMMMb.     │]],
                [[│     J88 _.-/    ";"-P----'    MM ,M'   Yb  MM    MM MM.  M'   MM    MM    MM    MM     │]],
                [[│     `--'\`|     /  /          MM 8M""""""  MM    MM `MM A'    MM    MM    MM    MM     │]],
                [[│         | /     |  |          MM YM.    ,  MM    MM  :MM;     MM    MM    MM    MM     │]],
                [[│         \|     /   |        .JMML.`Mbmmd'.JMML  JMML. VF    .JMML..JMML  JMML  JMML.   │]],
                [[│          `-----`---'--------=----=------=-----=------===-===-----==----==----==-----   │]],
                [[└────────────────────────────────────────────────────────────────────────────────────────┘]],
            }
        elseif width <= 88 and width > 20 and height > 60 then
            val = {
                [[┌───────────────────────────────────────────────┐]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠐⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡀⠂⠄⠤⡀⠄⢐⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠉⠄⠄⠐⠚⠙⠛⠂⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣠⡴⠄⠄⠄⠄⠄⠄⠄⣴⣿⣿⣿⣷⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⣀⣠⣀⠠⠗⠙⠁⠄⠄⠄⠄⠄⠄⠄⠄⢿⣿⣿⣾⣦⠄⢀⣀⣦⣤⡠⠄⠄⠄⢀⠄⠂⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠊⠊⠟⠉⠄⠄⢠⣠⡤⠄⠄⠄⠄⠄⠄⠄⠄⠄⠙⠛⠛⠃⠄⠉⠛⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢠⣴⠄⠄⠄⠐⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⠿⠟⠛⠉⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢠⡖⠁⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⡠⠄⠄⠄⠄⠄⠄⠄⠄⠐⠐⠄⠄⠄⠄⠄⠈⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠒⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⢄⣀⣀⣒⣒⣂⣲⣶⣞⣊⡁⠐⠖⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠂⠘⠑⠒⠒⠚⠛⠿⠿⢿⡿⣯⠭⢏⣉⠉⠁⠄⠄⠄⠉⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡀⣤⣤⡤⠤⢤⡀⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⠄⢀⡀⠄⠄⠤⠦⠤⠴⠧⠼⢿⠿⠿⠧⠒⠛⠁⠢⠤⢀⣀⣀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠐⠄⠰⡖⢲⣰⣒⣶⡶⣶⡦⠤⣤⠤⠤⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠆⠤⢀⠠⣠⢬⣟⣛⣿⣿⣿⣿⣟⣿⣿⣬⢿⣥⣤⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠉⠙⠛⠿⢿⢿⠿⣿⣿⣿⣯⣿⣻⠄⠁⠄⠄⠄⢀⠄⠄⠄⠄⡀⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⠄⡀⠄⢀⣛⠶⣶⣶⣶⣶⣶⣦⣦⢄⠄⠄⠁⠉⠄⠄⠄⠄⠐⠐⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠛⠒⠛⠻⠿⢿⣿⣿⣿⣿⣷⣹⠭⠅⠄⠄⠄⠂⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠁⠄⠠⢀⠄⠈⠻⠛⠒⠲⣶⣶⡬⠭⠍⠛⠈⠛⠛⠖⠠⠁⠈⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠄⠄⠄⠄⠄⠩⠙⠒⠂⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄/) ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄o ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄// _  _ _   _  ,_,  _ _ _ ⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄//_(/_/ / /_/ |/  (_/ / / /_ ⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄/) ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[│⠄⠄⠄⠄⠄⠄⠄⠄⠄(/ ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄│]],
                [[└───────────────────────────────────────────────┘]],
            }
        elseif width < 100 and width >= 60 and height <= 60 and height >= 46 then
            val = {
                [[┌──────────────────────────────────────────────────────────────┐]],
                [[│⠀⠀⠀⠀⠀⠀⠀⢀⣷⣼⣿⣿⣿⣿⣿⣿⣿⠻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⠀⠀⠀⠀⠀⠀⠘⠿⠿⠻⣛⣿⣿⣿⡵⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢟⢟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠟⠻⣿⢦⣄⣻⣿⣿⣿⡗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠛⠻⠿⠛⠿⠟⠿⣿⣿⣿⣿⣿⣿⡷│]],
                [[│⠀⠀⠀⠀⠀⠀⣠⣦⣿⣷⣷⣴⣿⢸⣿⣿⣿⣷⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⠀⠀⠀⠀⠀⠚⠻⠿⢛⣛⣻⣽⣿⣿⣷⣦⡤⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣄⣬⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⠀⠀⠀⠀⠀⠤⡶⠹⣿⣿⣿⣿⣿⡟⣿⣿⣾⣻⠟⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣝│]],
                [[│⣴⣦⣦⣄⣤⠀⠻⠿⠷⠈⠙⢫⣹⣧⣶⣽⢛⡛⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⣻⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿│]],
                [[│⣿⣿⣿⣷⣤⣄⡀⣀⣀⠘⢑⡿⣿⣿⣿⢿⣟⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣦⣾│]],
                [[│⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣥⠀⢨⣧⣀⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠁⢼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻│]],
                [[│⣁⣉⣻⣿⣿⣿⣿⣿⣿⣿⡿⠰⣾⣿⣿⡿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⢀⣇⠀⠀⠀⠀⠀⢀⢀⠠⢄⣤⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⣿⣟⣻⣿⠛⠻⠟⠟⢀⣙⣿⣷⡟⣿⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣺⡂⠀⣬⣷⡄⠀⢤⣇⣤⣿⣷⣾⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣾⣿⣦⡄⣀⣠⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠶⡎⡰⣾⣻⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣤⣤⣤⣤⣴⣿⣿⣧⣤⣤⣤⣰⣿⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│  ______     _,   _        │⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│ (  /       ( |  /o        │⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│  -/--_  _ _  | /,  _ _ _  │⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[│⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│ _/  (/_/ / /_|/ (_/ / / /_│⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│]],
                [[└────────────────┴───────────────────────────┴─────────────────┘]],
            }
        end
        return val
    end
    require("alpha.term")

    -- local dynamic_header_gif = {
    --     type = "terminal",
    --     command = "chafa -c full --fg-only --symbols braille ~/Documents/Photo:gif//db.gif",
    --     width = 40,
    --     height = 10,
    --     opts = {
    --         position = "center",
    --         redraw = true,
    --         window_config = {},
    --     },
   -- }

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

    --options = require("user.functions").load_override(options, "goolord/alpha-nvim")

   --  local function getGreeting(name)
   --      local tableTime = os.date("*t")
   --      local hour = tableTime.hour
   --      local greetingsTable = {
   --          [1] = "  Sleep well",
   --          [2] = "  Good morning",
   --          [3] = "  Good afternoon",
   --          [4] = "  Good evening",
   --          [5] = "望 Good night",
   --      }
   --      local greetingIndex = 0
   --      if hour == 23 or hour < 7 then
   --          greetingIndex = 1
   --      elseif hour < 12 then
   --          greetingIndex = 2
   --      elseif hour >= 12 and hour < 18 then
   --          greetingIndex = 3
   --      elseif hour >= 18 and hour < 21 then
   --          greetingIndex = 4
   --      elseif hour >= 21 then
   --          greetingIndex = 5
   --      end
   --      return greetingsTable[greetingIndex] .. ", " .. name
   --  end
   -- -- vim.notify = require("notify")(getGreeting("Saphia"), "info",
   -- --         {title = "Greetings", stages = "slide", render = "minimal"})
   --
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
