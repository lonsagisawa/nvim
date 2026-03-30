local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

later(function()
	require("gitsigns").setup({
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 300,
		},
	})
end)
