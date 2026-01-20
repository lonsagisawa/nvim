MiniDeps.add({ source = "stevearc/aerial.nvim" })

MiniDeps.later(function()
	require("aerial").setup({})

	vim.keymap.set("", "<leader>so", function()
		require("aerial").snacks_picker()
	end, { desc = "code Outline with aerial" })
end)
