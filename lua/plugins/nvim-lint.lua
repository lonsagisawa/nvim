MiniDeps.add({ source = "mfussenegger/nvim-lint" })

MiniDeps.later(function()
	require("lint").linters_by_ft = {
		php = { "phpcs", "phpstan" },
		lua = { "selene" },
		javascript = { "biome", "eslintd" },
		typescript = { "biome", "eslintd" },
		javascriptreact = { "biome", "eslintd" },
		typescriptreact = { "biome", "eslintd" },
		vue = { "biome", "eslintd" },
		svelte = { "biome", "eslintd" },
		astro = { "biome", "eslintd" },
	}
end)
