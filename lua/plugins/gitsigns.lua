MiniDeps.add({ source = "lewis6991/gitsigns.nvim" })

MiniDeps.later(function()
	require("gitsigns").setup({
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 300,
		},
	})
end)
