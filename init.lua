vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- import plugin settings
require("lazy").setup({
	{ import = "plugins" },
}, {})

-- setup lsp
require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
})

-- highlight on search
vim.o.hlsearch = false

-- line number
vim.wo.number = true

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
vim.wo.signcolumn = "yes"

-- decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- better completion
vim.o.completeopt = "menuone,noselect"

-- true color
vim.o.termguicolors = true

-- global statusline
vim.o.laststatus = 3

-- current line
vim.o.cursorline = true

-- space indent by default
vim.o.tabstop = 4
vim.o.expandtab = true

-- exrc
vim.o.exrc = true

require("keymap")
