-- Relative number toggle, only in insert mode
vim.api.nvim_command([[
augroup RelativeNumberToggle
autocmd InsertEnter * :set relativenumber
autocmd InsertLeave * :set norelativenumber
augroup END
]])
vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.autoread = true -- automatically update files if updated elsewhere.
vim.opt.autochdir = false -- automatically change nvim path to current buffer
vim.opt.backup = false -- creates a backup file

vim.opt.autoindent = true
vim.opt.ai = true --autoindent
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.diagnostic.hide()
vim.opt.termguicolors = true

vim.opt.smartindent = true

vim.opt.wrap = false --no raps line

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = false

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.listchars = {
    extends = "◣",
    lead = "⋅",
    precedes = "◢",
    space = "⋅",
    tab = "» ",
    trail = "·",
    -- nbsp = "⋅",
}
vim.cmd([[autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0]])
vim.opt.clipboard = { "unnamedplus", "unnamed" } -- allows neovim to access the system clipboard
local options = {
    autoread = true, -- automatically update files if updated elsewhere.
    autochdir = false, -- automatically change nvim path to current buffer
    backup = false, -- creates a backup file
    clipboard = { "unnamedplus", "unnamed" }, -- allows neovim to access the system clipboard
}


-- Now enable the options
for k, v in pairs(options) do
    vim.opt[k] = v
end
