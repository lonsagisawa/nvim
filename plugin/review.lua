local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({
	"https://github.com/esmuellert/codediff.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/georgeguimaraes/review.nvim",
})

later(function()
	require("review").setup()

	vim.keymap.set("", "<leader>r", "<cmd>Review<cr>", { desc = "Review" })
	vim.keymap.set("", "<leader>R", "<cmd>Review commits<cr>", { desc = "Review commits" })
end)
