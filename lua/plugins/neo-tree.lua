return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		enable_git_status = true,
		hijack_netrw_behavior = "open_default",
		window = {
			position = "left",
		},
		use_libuv_file_watcher = true,
	},
}
