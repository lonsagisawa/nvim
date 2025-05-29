return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
		lazy = true,
		-- config = function()
		-- 	require("nvim-treesitter.configs").setup({
		-- 		ensure_installed = maintained,
		-- 		auto_install = true,
		-- 		sync_install = false,
		-- 		ignore_install = {},
		-- 		modules = {},
		-- 		highlight = {
		-- 			enable = true,
		-- 			additional_vim_regex_highlighting = false,
		-- 		},
		-- 		indent = {
		-- 			enable = true,
		-- 		},
		-- 	})
		-- end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "VeryLazy",
		branch = "main",
	},
}
