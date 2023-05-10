return {
    -- Hex
    { "RaafatTurki/hex.nvim", event = "VeryLazy", config = true, },
    --undotree
    "mbbill/undotree",
    --notify
    { 'rcarriga/nvim-notify', event = "VimEnter", config = true, enabled = false },
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        enabled = true
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            require("safanvim.null").config() -- require your null-ls config here (example below)
        end,
    }


}
