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
			javascript = { "biome", "prettier", stop_after_first = true },
			typescript = { "biome", "prettier", stop_after_first = true },
			javascriptreact = { "biome", "prettier", stop_after_first = true },
			typescriptreact = { "biome", "prettier", stop_after_first = true },
			vue = { "prettier" },
			svelte = { "prettier" },
			yaml = { "yamlfmt" },
			css = { "biome", "prettier", stop_after_first = true },
			go = { "gofmt" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
	})
end)
