return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = {
			enabled = true,
		},
		lazygit = {
			enabled = true,
		},
		picker = {
			hidden = true,
			layout = {
				reverse = true,
				layout = {
					box = "horizontal",
					width = 0.9,
					height = 0.9,
					{
						box = "vertical",
						{ win = "list", border = "rounded" },
						{ win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "left" },
					},
					{
						win = "preview",
						width = 0.55,
						border = "rounded",
					},
				},
			},
		},
		indent = {
			animate = {
				enabled = false,
			},

			chunk = {
				enabled = true,

				char = {
					corner_top = "╭",
					corner_bottom = "╰",
					arrow = "─",
				},
			},
		},
		input = {
			enabled = true,
		},
		terminal = {
			enabled = true,
		},
		notifier = {
			style = "minimal",
			top_down = false,
		},
		zen = {
			enabled = true,
			toggles = {
				dim = false,
				git_signs = true,
				mini_diff_signs = true,
			},
			show = {
				statusline = true,
				tabline = true,
			}
		},
		dashboard = {
			sections = {
				{ section = "header" },
				{ section = "keys" },
				{
					pane = 2,
					icon = " ",
					title = "Git Status",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git status --short --branch --renames",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},
				{ section = "projects", pane = 2 },
				{ section = "startup", pane = 2 },
			},
			preset = {
				keys = {
					{ icon = "", key = "<Space>", desc = "Smart Finder", action = function() Snacks.dashboard.pick('smart') end, },
					{ icon = "", key = "g", desc = "Grep", action = function() require("grug-far").open() end, },
					{ icon = "", key = "e", desc = "File Explorer", action = function() require("mini.files").open() end, },
					{ icon = "", key = "lg", desc = "LazyGit", action = function() Snacks.lazygit.open() end, },
					{ icon = "󰐱", key = "ll", desc = "Lazy", action = ":Lazy" },
					{ icon = "", key = "t", desc = "Terminal", action = function() Snacks.terminal.toggle() end, },
					{ icon = "󰩈", key = "q", desc = "Quit", action = ":qa" },
				}
			},
		},
	},
	keys = {
		-- Lazygit
		{ "<leader>gg", function() Snacks.lazygit.open() end, desc = "LazyGit" },

		-- Terminal
		{ "<leader>t", function() Snacks.terminal.toggle() end, desc = "Terminal" },

		-- Picker
		-- Top Pickers & Explorer
		{ "<leader><space>", function() Snacks.picker.smart() end,                 desc = "Smart Find Files" },
		{ "<leader>,",       function() Snacks.picker.buffers() end,               desc = "Buffers" },
		{ "<leader>/",       function() Snacks.picker.grep() end,                  desc = "Grep" },
		{ "<leader>:",       function() Snacks.picker.command_history() end,       desc = "Command History" },
		{ "<leader>n",       function() Snacks.picker.notifications() end,         desc = "Notification History" },
		{ "<leader>sb",      function() Snacks.picker.lines() end,                 desc = "Buffer Lines" },
		{ "<leader>sB",      function() Snacks.picker.grep_buffers() end,          desc = "Grep Open Buffers" },
		-- { "<leader>sg",      function() Snacks.picker.grep() end,                  desc = "Grep" },
		{ "<leader>sw",      function() Snacks.picker.grep_word() end,             desc = "Visual selection or word", mode = { "n", "x" } },
		-- search
		{ '<leader>s"',      function() Snacks.picker.registers() end,             desc = "Registers" },
		{ '<leader>s/',      function() Snacks.picker.search_history() end,        desc = "Search History" },
		{ "<leader>sa",      function() Snacks.picker.autocmds() end,              desc = "Autocmds" },
		{ "<leader>sb",      function() Snacks.picker.lines() end,                 desc = "Buffer Lines" },
		{ "<leader>sc",      function() Snacks.picker.command_history() end,       desc = "Command History" },
		{ "<leader>sC",      function() Snacks.picker.commands() end,              desc = "Commands" },
		{ "<leader>sd",      function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
		{ "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,    desc = "Buffer Diagnostics" },
		{ "<leader>sh",      function() Snacks.picker.help() end,                  desc = "Help Pages" },
		{ "<leader>sH",      function() Snacks.picker.highlights() end,            desc = "Highlights" },
		{ "<leader>si",      function() Snacks.picker.icons() end,                 desc = "Icons" },
		{ "<leader>sj",      function() Snacks.picker.jumps() end,                 desc = "Jumps" },
		{ "<leader>sk",      function() Snacks.picker.keymaps() end,               desc = "Keymaps" },
		{ "<leader>sl",      function() Snacks.picker.loclist() end,               desc = "Location List" },
		{ "<leader>sm",      function() Snacks.picker.marks() end,                 desc = "Marks" },
		{ "<leader>sM",      function() Snacks.picker.man() end,                   desc = "Man Pages" },
		{ "<leader>sp",      function() Snacks.picker.lazy() end,                  desc = "Search for Plugin Spec" },
		{ "<leader>sq",      function() Snacks.picker.qflist() end,                desc = "Quickfix List" },
		{ "<leader>sR",      function() Snacks.picker.resume() end,                desc = "Resume" },
		{ "<leader>su",      function() Snacks.picker.undo() end,                  desc = "Undo History" },
		{ "<leader>uC",      function() Snacks.picker.colorschemes() end,          desc = "Colorschemes" },
		-- LSP
		{ "gd",              function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
		{ "gD",              function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
		{ "gr",              function() Snacks.picker.lsp_references() end,        nowait = true,                     desc = "References" },
		{ "gI",              function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
		{ "gy",              function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
		{ "<leader>ss",      function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
		{ "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

		-- zen
		{ "<leader>z", function() Snacks.zen() end, desc = "Zen" },
	}
}
