return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			enabled = true,
		},
		messages = {
			enabled = true,
		},
		popupmenu = {
			enabled = true,
		},
		notify = {
			enabled = false,
		},
		lsp = {
			progress = {
				enabled = false,
			},
			hover = {
				enabled = false,
			},
			message = {
				enabled = false,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
		},
	},
}
