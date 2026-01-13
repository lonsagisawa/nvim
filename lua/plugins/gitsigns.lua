local add = MiniDeps.add

add({ source = "lewis6991/gitsigns.nvim" })

return {
	source = "lewis6991/gitsigns.nvim",
	opts = {
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 300,
		},
	},
}
