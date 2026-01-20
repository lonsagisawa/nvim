MiniDeps.add({ source = "folke/trouble.nvim" })

MiniDeps.later(function()
	require("trouble").setup({})

	vim.keymap.set("", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
	vim.keymap.set(
		"",
		"<leader>xX",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		{ desc = "Buffer Diagnostics (Trouble)" }
	)
	vim.keymap.set("", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
	vim.keymap.set(
		"",
		"<leader>cl",
		"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		{ desc = "LSP Definitions / references / ... (Trouble)" }
	)
	vim.keymap.set("", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
	vim.keymap.set("", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
end)
