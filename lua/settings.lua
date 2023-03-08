-- Relative number toggle, only in insert mode
vim.api.nvim_command([[
augroup RelativeNumberToggle
autocmd InsertEnter * :set relativenumber
autocmd InsertLeave * :set norelativenumber
augroup END
]])
vim.opt.guicursor = ""

vim.opt.nu = true
--vim.opt.relativenumber = true

vim.opt.autoread = true -- automatically update files if updated elsewhere.
vim.opt.autochdir = false -- automatically change nvim path to current buffer
vim.opt.backup = false -- creates a backup file

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt. listchars = {
        extends = "◣",
        lead = "⋅",
        precedes = "◢",
        space = "⋅",
        tab = "» ",
        trail = "·",
        -- nbsp = "⋅",
    }
vim.cmd[[autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0]]
vim.opt.clipboard = ({ "unnamedplus", "unnamed" }) -- allows neovim to access the system clipboard

