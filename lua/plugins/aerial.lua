MiniDeps.add({ source = "stevearc/aerial.nvim" })

require("aerial").setup({})

vim.keymap.set("", "<leader>so", function()
	require("aerial").snacks_picker()
end, { desc = "code Outline with aerial" })
