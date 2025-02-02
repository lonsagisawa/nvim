return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
		"nvim-telescope/telescope.nvim", -- Optional: For using slash commands
		{ "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
	},
	config = {
		adapters = {
			groq = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					env = {
						url = "https://api.groq.com/openai",
						api_key = "GROQ_API_KEY",
					},
					schema = {
						model = {
							default = "llama-3.3-70b-versatile",
						},
					},
				})
			end,
		},
		strategies = {
			chat = {
				adapter = "groq",
			},
			inline = {
				adapter = "groq",
			},
		},
	},
}
