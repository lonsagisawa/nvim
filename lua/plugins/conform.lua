local add = MiniDeps.add

add({ source = "stevearc/conform.nvim" })

return {
	source = "stevearc/conform.nvim",
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
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
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
