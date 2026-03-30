local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({ "https://github.com/stevearc/aerial.nvim" })

later(function()
	require("aerial").setup({})

	vim.keymap.set("", "<leader>so", function()
		require("aerial").snacks_picker()
	end, { desc = "code Outline with aerial" })
end)
