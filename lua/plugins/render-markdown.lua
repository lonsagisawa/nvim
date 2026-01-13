local add = MiniDeps.add

add({ source = "MeanderingProgrammer/render-markdown.nvim" })

return {
	source = "MeanderingProgrammer/render-markdown.nvim",
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		file_types = { "markdown", "mdx", "AgenticChat" },

		completions = {
			blink = {
				enabled = true,
			},
		},
	},
}
