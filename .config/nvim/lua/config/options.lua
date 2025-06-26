-- [[ Setting options ]]
-- See `:help vim.o`

-- Set leader and localleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Highest conceal level for markdown documents
vim.opt.conceallevel = 2

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Set scroll offset
vim.o.scrolloff = 2

vim.o.softtabstop = 4
vim.o.tabstop = 4

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menu,menuone,noselect"

vim.o.termguicolors = true
