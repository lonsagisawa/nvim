vim.api.nvim_create_autocmd("PackChanged", { callback = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind
	if name == "nvim-treesitter" and kind == "update" then
		if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
		require("nvim-treesitter").update()
	end
end })

vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", pin = "4916d6592ede8c07973490d2f187e07dfefac" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", pin = "93d60a475f0b08a8eceb99255863977d3a25f310" },
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
