local add = MiniDeps.add

add({ source = "rachartier/tiny-inline-diagnostic.nvim" })

return {
	source = "rachartier/tiny-inline-diagnostic.nvim",
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "classic",
		})

		vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
	end,
}
