local add = MiniDeps.add

add({
	source = "folke/lazydev.nvim",
	depends = { "Bilal2453/luvit-meta" },
})
add({ source = "Bilal2453/luvit-meta" })

return {
	{
		source = "folke/lazydev.nvim",
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ source = "Bilal2453/luvit-meta" }, -- optional `vim.uv` typings
}
