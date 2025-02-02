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
		require("telescope").load_extension("smart_open")
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		{
			"danielfalk/smart-open.nvim",
			branch = "0.2.x",
			dependencies = {
				"kkharji/sqlite.lua",
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					build = "make",
				},
			},
		},
	},
	keys = {
		{ "<leader><leader>", "<cmd>Telescope smart_open<cr>",           desc = "Fuzzy finder" },
		{ "<leader>sg",       "<cmd>Telescope live_grep<cr>",            desc = "Live grep" },
		-- LSP
		{ "<leader>ss",       "<cmd>Telescope lsp_document_symbols<cr>", desc = "Search Symbols" },
		{ "gr",               "<cmd>Telescope lsp_references<cr>",       desc = "References" },
		{ "gd",               "<cmd>Telescope lsp_definitions<cr>",      desc = "Definitions" },
		{ "gt",               "<cmd>Telescope lsp_type_definition<cr>",  desc = "Type definitions" },
		{ "gi",               "<cmd>Telescope lsp_implementations<cr>",  desc = "Implementations" },
	},
}
