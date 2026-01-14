MiniDeps.add({
	source = "nvim-treesitter/nvim-treesitter",
	checkout = "main",
	hooks = {
		post_checkout = function() require("nvim-treesitter").update() end
	},
})

MiniDeps.add({
	source = "nvim-treesitter/nvim-treesitter-textobjects",
	checkout = "main",
	depends = { "nvim-treesitter/nvim-treesitter" },
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local filetype = args.match
		local lang = vim.treesitter.language.get_lang(filetype)
		if vim.tbl_contains(require("nvim-treesitter.config").get_available(), lang) then
			require("nvim-treesitter").install(lang):await(function()
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				pcall(vim.treesitter.start)
			end)
		end
	end,
})
