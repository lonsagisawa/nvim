return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"catppuccin/nvim",
	},
	config = function()
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
			options = {
				diagnostics = "nvim_lsp",
				separator_style = "thick",
			},
		})
	end,
}
