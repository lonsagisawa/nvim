local add = MiniDeps.add

add({ source = "lewis6991/hover.nvim" })

return {
	source = "lewis6991/hover.nvim",
	opts = {
		init = function()
			-- Require providers
			require("hover.providers.lsp")
			require("hover.providers.diagnostic")
		end,

		preview_opts = {
			border = "rounded",
		},

		-- Whether the contents of a currently open hover window should be moved
		-- to a :h preview-window when pressing the hover keymap.
		preview_window = false,
		title = true,
	},
	keys = {
		{ "K", function() require("hover").open() end, desc = "hover.nvim" },
		{ "gK", function() require("hover").select() end, desc = "hover.nvim (select)" },
		{ "<C-p>", function() require("hover").switch("previous") end, desc = "hover.nvim (previous source)" },
		{ "<C-n>", function() require("hover").switch("next") end, desc = "hover.nvim (next source)" },
	},
}
