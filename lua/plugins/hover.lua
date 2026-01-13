MiniDeps.add({ source = "lewis6991/hover.nvim" })

require("hover.providers.lsp")
require("hover.providers.diagnostic")

require("hover").setup({
	preview_opts = {
		border = "rounded",
	},
	preview_window = false,
	title = true,
})

vim.keymap.set("", "K", function()
	require("hover").open()
end, { desc = "hover.nvim" })
vim.keymap.set("", "gK", function()
	require("hover").select()
end, { desc = "hover.nvim (select)" })
vim.keymap.set("", "<C-p>", function()
	require("hover").switch("previous")
end, { desc = "hover.nvim (previous source)" })
vim.keymap.set("", "<C-n>", function()
	require("hover").switch("next")
end, { desc = "hover.nvim (next source)" })
