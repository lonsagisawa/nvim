local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

later(function()
	vim.keymap.set("", "<leader>f", function()
		require("conform").format({ async = true })
	end, { desc = "Format buffer" })

	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			php = { "pint", "php-cs-fixer", stop_after_first = true },
			javascript = { "oxfmt", "biome", "prettier", stop_after_first = true },
			typescript = { "oxfmt", "biome", "prettier", stop_after_first = true },
			javascriptreact = { "oxfmt", "biome", "prettier", stop_after_first = true },
			typescriptreact = { "oxfmt", "biome", "prettier", stop_after_first = true },
			vue = { "oxfmt", "prettier", stop_after_first = true },
			svelte = { "prettier" },
			yaml = { "yamlfmt" },
			css = { "oxfmt", "biome", "prettier", stop_after_first = true },
			go = { "gofmt" },
			rust = { "rustfmt" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
	})
end)
