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
		picker = {
			enabled = true,
		},
		indent = {
			enabled = true,
			chunk = {
				enabled = true,
			},
		},
		explorer = {
			enabled = true,
			replace_netrw = true,
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
		{
			"<leader><leader>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart picker"
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "Explorer",
		}
	}
}
