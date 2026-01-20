MiniDeps.add({
	source = "folke/lazydev.nvim",
	depends = { "Bilal2453/luvit-meta" },
})

MiniDeps.later(function()
	require("lazydev").setup({
		library = {
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
		},
	})
end)
