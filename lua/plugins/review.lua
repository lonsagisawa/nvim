MiniDeps.add({
	source = "georgeguimaraes/review.nvim",
	depends = {
		"esmuellert/codediff.nvim",
		"MunifTanjim/nui.nvim",
	},
})

MiniDeps.later(function()
	require("review").setup()

	vim.keymap.set("", "<leader>r", "<cmd>Review<cr>", { desc = "Review" })
	vim.keymap.set("", "<leader>R", "<cmd>Review commits<cr>", { desc = "Review commits" })
end)
