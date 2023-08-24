local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local config = {
    cmd = {
        'java',
	"-Declipse.application=org.eclipse.jdt.ls.core.id1",
	'-Dosgi.bundles.defaultStartLevel=4',
	'-Declipse.product=org.eclipse.jdt.ls.core.product',
	'-Dlog.level=ALL',
        '-noverfy',
	'-Xmx1G',
	'-jar','/Library/Java/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
	'-configuration','/Library/Java/jdt-language-server-1.9.0-202203031534/config_mac/',
	'-data', vim.fn.expand('~/.cache/jdtls-workspace') .. workspace_dir,
	--add-modules=ALL-SYSTEM
	--add-opens java.base/java.util=ALL-UNNAMED 
	--add-opens java.base/java.lang=ALL-UNNAMED
},
    root_dir = require('jdtls.setup').find_root({'.git','mvnm','gradlew'}),
    capabilities = capabilities

}
require('jdtls').start_or_attach(config)

--keymaps

local opts = {noremape=true, silent=true}

vim.api.nvim_set_keymap('n','gD', '<cmd>lua vim.lsp.buf.delaration()<CR>',opts)
vim.api.nvim_set_keymap('n','gd','<cmd>lua vim.lsp.buf.defintion()<CR>',opts)
vim.api.nvim_set_keymap('n','K', '<cmd>lua vim.lsp.buf.hover()<CR>',opts)
vim.api.nvim_set_keymap('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>',opts)
vim.api.nvim_set_keymap('n','<C-K>','<cmd>lua vim.lsp.buf.signature_help()<CR>',opts)
vim.api.nvim_set_keymap('n','<leader>wa','<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',opts)
vim.api.nvim_set_keymap('n','<leader>wr','<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',opts)
vim.api.nvim_set_keymap('n','<leader>wl','<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders())).<CR>',opts)
vim.api.nvim_set_keymap('n','<leader>D','<cmd>lua vim.lsp.buf.type_defintion()<CR>',opts)
vim.api.nvim_set_keymap('n','<leader>rn','<cmd>lua vim.lsp.buf.rename()<CR>',opts)
vim.api.nvim_set_keymap('n','gr','<cmd>lua vim.lsp.buf.references()<CR>',opts)
vim.api.nvim_set_keymap('n','<leader>e','<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',opts)
vim.api.nvim_set_keymap('n','[d','<cmd>lua vim.lsp.diagnostic.goto_prev<CR>',opts)
vim.api.nvim_set_keymap('n',']d','<cmd>lua vim.lsp.diagnostic.goto_next<CR>',opts)
vim.api.nvim_set_keymap('n','<leader>q','<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',opts)
vim.api.nvim_set_keymap('n','<leader>f','<cmd>lua vim.lsp.buf.formatting()<CR>',opts)
vim.api.nvim_set_keymap('n','<leader>lg','<cmd>lua vim.lsp.buf.formatting_sync(nil,100)<CR>',opts)

vim.api.nvim_set_keymap('n','<leader>lA','<cmd>lua require(\'jdtls\').code_action<CR>',{silent = true})
