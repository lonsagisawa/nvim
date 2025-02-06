return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = {
			enabled = true,
		},
		lazygit = {
			enabled = true,
		},
	},
	keys = {
		{
			"<leader>gg",
			function()
				Snacks.lazygit.open()
			end,
			desc = "LazyGit"
		},
	}
}
