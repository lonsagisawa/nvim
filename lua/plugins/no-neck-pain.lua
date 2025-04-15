return {
	"shortcuts/no-neck-pain.nvim",
	event = "VeryLazy",
	opts = {
		width = 160,
		autocmds = {
			enableOnVimEnter = false,
			skipEnteringNoNeckPainBuffer = true,
		},
	},
}
