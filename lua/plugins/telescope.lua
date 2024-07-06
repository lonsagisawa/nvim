return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		extensions = {
			smart_open = {
				match_algorithm = "fzf",
			},
		},
	},
}
