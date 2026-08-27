-- Plugins
vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

local mason_servers = {
	"astro",
	"cssls",
	"css_variables",
	"cssmodules_ls",
	"docker_compose_language_service",
	"dockerls",
	"html",
	"lua_ls",
	"marksman",
	"phpantom_lsp",
	"svelte",
	"tailwindcss",
	"vtsls",
	"vue_ls",
}

local non_mason_servers = {
	"laravel_lsp",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = mason_servers,
	automatic_enable = true,
})
require("mason-tool-installer").setup({
	ensure_installed = {
		"tree-sitter-cli",

		-- formatters
		"stylua",
	}
})

vim.lsp.enable(non_mason_servers)
