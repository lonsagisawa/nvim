local add = MiniDeps.add

add({ source = "stevearc/conform.nvim" })

vim.keymap.set("", "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "Format buffer" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		php = { "pint", "php-cs-fixer", stop_after_first = true },
		javascript = { "biome", "prettier", stop_after_first = true },
		typescript = { "biome", "prettier", stop_after_first = true },
		javascriptreact = { "biome", "prettier", stop_after_first = true },
		typescriptreact = { "biome", "prettier", stop_after_first = true },
		vue = { "prettier" },
		svelte = { "prettier" },
		yaml = { "yamlfmt" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
})
