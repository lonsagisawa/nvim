vim.api.nvim_create_autocmd("FileType", {
	pattern = { "php", "blade" },
	callback = function()
		vim.lsp.start({
			name = "laravel-ls",
			cmd = { "laravel-ls" },
			root_dir = vim.fn.getcwd(),
		})
	end,
})
