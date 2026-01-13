local add = MiniDeps.add

add({ source = "mfussenegger/nvim-lint" })

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
