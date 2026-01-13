local add = MiniDeps.add

add({ source = "MeanderingProgrammer/render-markdown.nvim" })

require("render-markdown").setup({
	file_types = { "markdown", "mdx", "AgenticChat" },

	completions = {
		blink = {
			enabled = true,
		},
	},
})
