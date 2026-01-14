-- vim loader
vim.loader.enable()

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- mini.nvim, mini.deps initialization
local path_package = vim.fn.stdpath("data") .. "/site"
local mini_path = path_package .. "/pack/deps/start/mini.nvim"
local uv = vim.uv or vim.loop

if not uv.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
        'git', 'clone', '--filter=blob:none',
        'https://github.com/nvim-mini/mini.nvim', mini_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require("mini.deps").setup()

local function load_plugins()
    local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
    local modules = {}

    for name, type_ in vim.fs.dir(plugin_dir) do
        if type_ == "file" and name:sub(-4) == ".lua" then
            table.insert(modules, "plugins." .. name:gsub("%.lua$", ""))
        end
    end

    table.sort(modules)

    for _, module_name in ipairs(modules) do
        pcall(require, module_name)
    end
end

load_plugins()

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

-- exrc
vim.o.exrc = true

-- autohide cmdline
vim.o.cmdheight = 0

vim.o.winblend = 0

vim.o.shell = "fish"

vim.o.winborder = "rounded"

require("config.keymap")
