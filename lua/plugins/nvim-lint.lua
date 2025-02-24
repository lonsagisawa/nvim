return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			php = { "phpcs", "phpstan" },
			lua = { "selene" },
			javascript = { "biome", "eslintd" },
			typescript = { "biome", "eslintd" },
			javascriptreact = { "biome", "eslintd" },
			typescriptreact = { "biome", "eslintd" },
			vue = { "eslintd" },
			svelte = { "eslintd" },
		}
	end,
}
