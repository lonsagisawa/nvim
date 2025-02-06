return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({})

		vim.keymap.set({ "n", "x" }, "<leader>e", function() require("nvim-tree.api").tree.toggle() end,
			{ desc = "Explorer" })
	end,
}
