-- Plugins
vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
})

local mason_servers = {
	"astro",
	"cssls",
	"css_variables",
	"cssmodules_ls",
	"docker_compose_language_service",
	"dockerls",
	"html",
	"intelephense",
	"laravel_ls",
	"lua_ls",
	"marksman",
	"svelte",
	"tailwindcss",
	"vtsls",
	"vue_ls",
}

local non_mason_servers = {
	-- Masonのリポジトリに入っていないLSPが出てきたら
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = mason_servers,
	automatic_enable = true,
})

vim.lsp.enable(non_mason_servers)
