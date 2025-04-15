return {
	"lewis6991/hover.nvim",
	opts = {
		init = function()
			-- Require providers
			require("hover.providers.lsp")
			require('hover.providers.diagnostic')
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
		{ "K", function() require("hover").hover({}) end, desc = "hover.nvim" },
		{ "gK", function() require("hover").hover_select({}) end, desc = "hover.nvim (select)" },
		{ "<C-p>", function() require("hover").hover_switch("previous") end, desc = "hover.nvim (previous source)" },
		{ "<C-n>", function() require("hover").hover_switch("next") end, desc = "hover.nvim (next source)" },
	}
}
