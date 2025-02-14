return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.cursorword").setup()
		require("mini.trailspace").setup()
		require("mini.splitjoin").setup()
		require("mini.icons").setup()
		require("mini.ai").setup()
		require("mini.surround").setup()

		require("mini.files").setup({
			mappings = {
				go_in_plus = "l",
			},
			options = {
				use_as_default_explorer = false,
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				MiniTrailspace.trim()
				MiniTrailspace.trim_last_lines()
			end,
		})
	end,
	keys = {
		{
			"<leader>e",
			function()
				MiniFiles.open()
			end,
			desc = "Explorer",
		},
	},
}
