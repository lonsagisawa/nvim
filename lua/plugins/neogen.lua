MiniDeps.add({ source = "danymat/neogen" })

MiniDeps.later(function()
	require("neogen").setup({
		snippet_engine = "nvim",
	})
end)
