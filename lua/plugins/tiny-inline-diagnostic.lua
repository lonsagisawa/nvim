local add = MiniDeps.add

add({ source = "rachartier/tiny-inline-diagnostic.nvim" })

require("tiny-inline-diagnostic").setup({
	preset = "classic",
})

vim.diagnostic.config({ virtual_text = false })
