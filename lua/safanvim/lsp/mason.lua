local M = {}
M.tools = {
    "black",
    "clang-format",
    "codelldb",
    "debugpy",
    "eslint_d",
    "flake8",
    "luacheck",
    "markdownlint",
    "prettierd",
    "ruff",
    "selene",
    "shellcheck",
    "shfmt",
    "stylua",
}

function M.check()
    local mr = require("mason-registry")
    for _, tool in ipairs(M.tools) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
            p:install()
        end
    end
end

function M.config()
    local opts = {
        on_attach = require("safanvim.lsp.handlers").on_attach,
        capabilities = require("safanvim.lsp.handlers").capabilities,
    }

    require("mason").setup({
        ui = {
            border = require("core.prefs").ui.border_style,
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
    })

    require("mason-lspconfig").setup({
        ensure_installed = {
            "bashls",
            "clangd",
            "html",
            "jsonls",
            "marksman",
            "omnisharp",
            "rust_analyzer",
            "lua_ls",
            "tsserver",
            "yamlls",
        },
        automatic_installation = true,
    })

    require("mason-lspconfig").setup_handlers({
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup(opts)
        end,

        ["jdtls"] = function()
        --     local java_opts = require("fenvim.lsp.settings.java")
        --     require("jdtls").start_or_attach(java_opts)
        end,

        ["rust_analyzer"] = function()
            local rust_opts = require("safanvim.lsp.settings.rust")
            require("rust-tools").setup(rust_opts)
        end,

        ["tsserver"] = function()
            local tsserver_opts = require("safanvim.lsp.settings.tsserver")
            local extra_opts =
                { on_attach = { client = { server_capabilities = { documentFormattingProvider = false } } } }
            local tsserver_opts_ext = vim.tbl_deep_extend("force", extra_opts, opts)
            require("typescript").setup({ server = tsserver_opts_ext, tsserver_opts })
        end,

        ["clangd"] = function()
            local clangd_opts = require("safanvim.lsp.settings.clangd")
            local clangd_opts_ext = vim.tbl_deep_extend("force", clangd_opts, opts)
            require("lspconfig").clangd.setup(clangd_opts_ext)
        end,

        ["jsonls"] = function()
            local jsonls_opts = require("safanvim.lsp.settings.jsonls")
            local jsonls_opts_ext = vim.tbl_deep_extend("force", jsonls_opts, opts)
            require("lspconfig").jsonls.setup(jsonls_opts_ext)
        end,

        ["omnisharp"] = function()
            local omnisharp_opts = require("safanvim.lsp.settings.omnisharp")
            local omnisharp_opts_ext = vim.tbl_deep_extend("force", omnisharp_opts, opts)
            require("lspconfig").omnisharp.setup(omnisharp_opts_ext)
        end,
        ["lua_ls"] = function()
            local lua_ls_opts = require("safanvim.lsp.settings.lua_ls")
            local lua_ls_opts_ext = vim.tbl_deep_extend("force", lua_ls_opts, opts)
            require("lspconfig").lua_ls.setup(lua_ls_opts_ext)
        end,

        ["bashls"] = function()
            local bash_opts = require("safanvim.lsp.settings.bash")
            local bash_opts_ext = vim.tbl_deep_extend("force", bash_opts, opts)
            require("lspconfig").bashls.setup(bash_opts_ext)
        end,

        ["perlnavigator"] = function()
            local perlnavigator_opts = require("safanvim.lsp.settings.perl")
            local perlnavigator_opts_ext = vim.tbl_deep_extend("force", perlnavigator_opts, opts)
            require("lspconfig").perlnavigator.setup(perlnavigator_opts_ext)
        end,

        ["pyright"] = function()
            local pyright_opts = require("safanvim.lsp.settings.pyright")
            local pyright_opts_ext = vim.tbl_deep_extend("force", pyright_opts, opts)
            require("lspconfig").pyright.setup(pyright_opts_ext)
        end,
    })
end
return M
