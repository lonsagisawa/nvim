return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = function()
			require("nvim-treesitter").update()
		end,
		-- https://github.com/nvim-treesitter/nvim-treesitter/discussions/7894#discussioncomment-13296610
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local filetype = args.match
					local lang = vim.treesitter.language.get_lang(filetype)
					if vim.tbl_contains(require("nvim-treesitter.config").get_available(), lang) then
						require("nvim-treesitter").install(lang):await(function()
							vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
							vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
							vim.treesitter.start()
						end)
					end
				end
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "VeryLazy",
		branch = "main",
	},
}
