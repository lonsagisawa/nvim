MiniDeps.add({ source = "rachartier/tiny-inline-diagnostic.nvim" })

MiniDeps.later(function()
	require("tiny-inline-diagnostic").setup({
		preset = "classic",
	})

	vim.diagnostic.config({ virtual_text = false })
end)
