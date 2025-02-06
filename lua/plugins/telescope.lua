return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	config = function()
		require("telescope").setup({
			extensions = {
				smart_open = {
					match_algorithm = "fzf",
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	keys = {
		{ "<leader>sg",       "<cmd>Telescope live_grep<cr>",            desc = "Live grep" },
		-- LSP
		{ "<leader>ss",       "<cmd>Telescope lsp_document_symbols<cr>", desc = "Search Symbols" },
		{ "gr",               "<cmd>Telescope lsp_references<cr>",       desc = "References" },
		{ "gd",               "<cmd>Telescope lsp_definitions<cr>",      desc = "Definitions" },
		{ "gt",               "<cmd>Telescope lsp_type_definition<cr>",  desc = "Type definitions" },
		{ "gi",               "<cmd>Telescope lsp_implementations<cr>",  desc = "Implementations" },
	},
}
