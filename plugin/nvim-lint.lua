local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })

later(function()
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
