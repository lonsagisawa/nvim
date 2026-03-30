local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" })

later(function()
	require("render-markdown").setup({
		file_types = { "markdown", "mdx", "AgenticChat" },

		completions = {
			blink = {
				enabled = true,
			},
		},
	})
end)
