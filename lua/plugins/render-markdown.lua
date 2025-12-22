return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown", "mdx", "AgenticChat" },
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
