vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- lazy.nvim
require("config.lazy")

-- setup lsp
require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
})

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

-- global statusline
vim.o.laststatus = 3

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
vim.o.scrolloff = 8

-- exrc
vim.o.exrc = true

require("config.keymap")
require("config.tree-sitter-blade")
