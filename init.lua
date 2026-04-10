-- vim loader
vim.loader.enable()

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("vim._core.ui2").enable({
	enable = true,
	msg = {
		targets = {
			[""] = "msg",
			empty = "cmd",
			bufwrite = "msg",
			confirm = "cmd",
			emsg = "pager",
			echo = "msg",
			echomsg = "msg",
			echoerr = "pager",
			completion = "cmd",
			list_cmd = "pager",
			lua_error = "pager",
			lua_print = "msg",
			progress = "pager",
			rpc_error = "pager",
			quickfix = "msg",
			search_cmd = "cmd",
			search_count = "cmd",
			shell_cmd = "pager",
			shell_err = "pager",
			shell_out = "pager",
			shell_ret = "msg",
			undo = "msg",
			verbose = "pager",
			wildlist = "cmd",
			wmsg = "msg",
			typed_cmd = "cmd",
		},
		cmd = {
			height = 0.5,
		},
		dialog = {
			height = 0.5,
		},
		msg = {
			height = 0.3,
			timeout = 5000,
		},
		pager = {
			height = 0.5,
		},
	},
})

-- setup lsp
require("lsp")

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
vim.o.clipboard = "unnamed,unnamedplus"

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

vim.o.cmdheight = 0

vim.o.winblend = 0

vim.o.shell = "fish"

vim.o.winborder = "rounded"

require("keymap")
