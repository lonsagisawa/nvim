local add = MiniDeps.add

local function treesitter_build(hook)
	if hook and hook.name then
		pcall(vim.cmd, "packadd " .. hook.name)
	end
	require("nvim-treesitter").update()
end

add({
	source = "nvim-treesitter/nvim-treesitter",
	checkout = "main",
	hooks = {
		post_install = treesitter_build,
		post_checkout = treesitter_build,
	},
})
add({
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
