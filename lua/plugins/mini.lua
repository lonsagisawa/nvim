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
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				require("mini.trailspace").trim()
				require("mini.trailspace").trim_last_lines()
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
