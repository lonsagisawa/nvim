local add = MiniDeps.add

add({ source = "shortcuts/no-neck-pain.nvim" })

require("no-neck-pain").setup({
	width = 160,
	autocmds = {
		enableOnVimEnter = false,
		skipEnteringNoNeckPainBuffer = true,
	},
})
