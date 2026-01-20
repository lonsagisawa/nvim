MiniDeps.add({ source = "folke/snacks.nvim" })

MiniDeps.later(function()
	require("snacks").setup({
		bigfile = {
			enabled = true,
		},
		lazygit = {
			enabled = true,
		},
		picker = {
			hidden = true,
			layout = {
				layout = {
					row = 1,
					width = 0.3,
					min_width = 80,
					height = 0.9,
					box = "vertical",
					{
						box = "vertical",
						border = "rounded",
						title = "{title} {live} {flags}",
						height = 10,
						{
							win = "input",
							height = 1,
							title_pos = "center",
							border = "bottom",
						},
						{ win = "list", height = 8 },
					},
					{ win = "preview", border = "rounded" },
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
			},
		},
	})

	-- stylua: ignore start

	-- keybinds
	vim.keymap.set("", "<leader>gg", function() Snacks.lazygit.open() end, { desc = "LazyGit" })
	vim.keymap.set("", "<leader>t", function() Snacks.terminal.toggle() end, { desc = "Terminal" })
	vim.keymap.set("", "<leader>z", function() Snacks.zen() end, { desc = "Zen" })

	-- Picker keybinds
	vim.keymap.set("", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
	vim.keymap.set("", "<leader>,", function() Snacks.picker.buffers() end, { desc = "Buffers" })
	vim.keymap.set("", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
	vim.keymap.set("", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" })
	vim.keymap.set("", "<leader>n", function() Snacks.picker.notifications() end, { desc = "Notification History" })
	vim.keymap.set("", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
	vim.keymap.set("", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
	vim.keymap.set({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })
	vim.keymap.set("", '<leader>s"', function() Snacks.picker.registers() end, { desc = "Registers" })
	vim.keymap.set("", '<leader>s/', function() Snacks.picker.search_history() end, { desc = "Search History" })
	vim.keymap.set("", "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
	vim.keymap.set("", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
	vim.keymap.set("", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
	vim.keymap.set("", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
	vim.keymap.set("", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
	vim.keymap.set("", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
	vim.keymap.set("", "<leader>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" })
	vim.keymap.set("", "<leader>si", function() Snacks.picker.icons() end, { desc = "Icons" })
	vim.keymap.set("", "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
	vim.keymap.set("", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
	vim.keymap.set("", "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" })
	vim.keymap.set("", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
	vim.keymap.set("", "<leader>sM", function() Snacks.picker.man() end, { desc = "Man Pages" })
	vim.keymap.set("", "<leader>sp", function() Snacks.picker.lazy() end, { desc = "Search for Plugin Spec" })
	vim.keymap.set("", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
	vim.keymap.set("", "<leader>sR", function() Snacks.picker.resume() end, { desc = "Resume" })
	vim.keymap.set("", "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo History" })
	vim.keymap.set("", "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })

	-- LSP pickers
	vim.keymap.set("", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
	vim.keymap.set("", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
	vim.keymap.set("", "gr", function() Snacks.picker.lsp_references() end, { desc = "References", nowait = true })
	vim.keymap.set("", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
	vim.keymap.set("", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
	vim.keymap.set("", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
	vim.keymap.set("", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })

	-- stylua: ignore end
end)
