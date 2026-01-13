local add = MiniDeps.add

add({ source = "shortcuts/no-neck-pain.nvim" })

return {
	source = "shortcuts/no-neck-pain.nvim",
	opts = {
		width = 160,
		autocmds = {
			enableOnVimEnter = false,
			skipEnteringNoNeckPainBuffer = true,
		},
	},
}
