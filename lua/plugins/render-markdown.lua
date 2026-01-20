MiniDeps.add({ source = "MeanderingProgrammer/render-markdown.nvim" })

MiniDeps.later(function()
	require("render-markdown").setup({
		file_types = { "markdown", "mdx", "AgenticChat" },

		completions = {
			blink = {
				enabled = true,
			},
		},
	})
end)
