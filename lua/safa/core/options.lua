-- to show relativenumber just in insert mode.
vim.api.nvim_command([[
augroup RelativeNumberToggle
autocmd InsertEnter * :set relativenumber
autocmd InsertLeave * :set norelativenumber
augroup END
]])

local opt = vim.opt --for conciseness
-- line numbers
opt.number = true 

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.expandtab = true

-- line wrapping
opt.wrap = false

-- search settings 
opt.ignorecase = true
-- those next three comment is for smartcase :)
-- it is good for looking up word (ex: hello Hello)
--if type h small letter will select both 
--if i type H cap will select only the cape one(will asume it is case sensitive) 
opt.smartcase = true

-- cursor line 
opt.cursorline = true

-- appearance 
opt.termguicolors = true 
opt.background = "dark"
opt.signcolumn = "yes" -- look up for it

-- backspace 
opt.backspace = "indent,eol,start"

-- clipboard 
-- this is handy when i copy something from nvim :)
opt.clipboard:append("unnamedplus")

-- split windows 
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")


opt.autoread = true -- automatically update files if updated elsewhere.
opt.autochdir = false -- automatically change nvim path to current buffer
opt.backup = false -- creates a backup file

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"
opt. listchars = {
        extends = "◣",
        lead = "⋅",
        precedes = "◢",
        space = "⋅",
        tab = "» ",
        trail = "·",
        
    }

