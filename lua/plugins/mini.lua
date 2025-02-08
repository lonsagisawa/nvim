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
				close = "<ESC>",
				go_in_plus = "l",
				go_out_plus = "h",
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
