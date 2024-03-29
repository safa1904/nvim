return {
    {
        -- Auto bracket pairs
        "windwp/nvim-autopairs",
        event = "BufReadPost",
        config = function()
            require("safanvim.editor.autopairs").config()
        end,
    },
    {
        -- Text alignment
        "echasnovski/mini.align",
        branch = "stable",
        event = "BufReadPost",
        config = function()
            require("safanvim.editor.align").config()
        end,
    },
    {
        -- True/False toggler
        "nat-418/boole.nvim",
        event = "BufReadPost",
        opts = {
            mappings = {
                increment = "<C-a>",
                decrement = "<C-x>",
            },
            -- User defined loops ()
            additions = {
                { "Foo", "Bar" },
                { "tic", "tac", "toe" },
            },
        },
    },
    {
        -- dots in indents for easy space counting
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
        config = function()
            require("safanvim.editor.blankline").config()
        end,
    },
    {
        -- Automatically change tabstop to match doc
        "nmac427/guess-indent.nvim",
        event = "BufReadPre",
        config = true,
    },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("safanvim.editor.toggleterm").config()
        end,
    },
    {
        "CRAG666/code_runner.nvim",
        event = "VeryLazy",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("safanvim.editor.coderunner").config()
        end,
    },

    {
        "is0n/jaq-nvim",
        event = "VeryLazy",
        enabled = false,
        config = function()
            require("safanvim.editor.jaq").config()
        end,
    },
       {
        "gaoDean/autolist.nvim",
        ft = {
            "markdown",
            "text",
            "tex",
            "plaintex",
        },
        event = "BufReadPost",
        enabled = false,
        config = function()
            require("safanvim.editor.autolist").config()
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        config = function()
            require("safanvim.editor.trouble").config()
        end,
    },
    {
        "kylechui/nvim-surround",
        config = true,
        event = "BufReadPost",
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = "ToggleMarkdownPreview",
        ft = { "md", "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        config = true,
        ft = { "typescript", "html", "tsx", "vue", "svelte", "php", "rescript" },
    },
    {
        -- Hex editor
        "RaafatTurki/hex.nvim",
        config = true,
        event = "VeryLazy",
        enabled = true,
    },
    {
        "simrat39/symbols-outline.nvim",
        config = true,
        opts = { relative_width = true, width = 10 },
        cmd = "SymbolsOutline",
    },
    {
        -- Big files over 2mb activate BigFile mode, disabling some plugins.
        "LunarVim/bigfile.nvim",
        enabled = true,
        config = true,
    },
}
