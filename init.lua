-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- lazy.nvim
require("config.lazy")

-- setup lsp
require("config.lsp")

-- set colorscheme
vim.cmd.colorscheme("catppuccin")

-- highlight on search
vim.o.hlsearch = false

-- incremental search
vim.o.incsearch = true

-- line number
vim.o.number = true
vim.o.relativenumber = true

-- mouse
vim.o.mouse = "a"

-- clipboard
vim.o.clipboard = "unnamedplus"

-- break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- case-insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- signcolumn
vim.o.signcolumn = "yes"

-- decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- better completion
vim.o.completeopt = "menu,menuone,noselect"

-- true color
vim.o.termguicolors = true

-- current line
vim.o.cursorline = true

-- space indent by default
vim.o.tabstop = 4
vim.o.expandtab = true

-- Smart indent
vim.o.smartindent = true

-- Round indent
vim.o.shiftround = true

-- show invisible characters
vim.o.list = true

-- scrolloff
vim.o.scrolloff = 12

-- exrc
vim.o.exrc = true

-- autohide cmdline
vim.o.cmdheight = 0

require("config.keymap")
require("config.tree-sitter-blade")
require("config.laravel-ls")
