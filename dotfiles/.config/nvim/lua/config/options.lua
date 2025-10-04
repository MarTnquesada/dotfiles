-- Set leader keys (MUST be done before lazy setup) 
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse support
vim.opt.mouse = "a"

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Use system clipboard
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
