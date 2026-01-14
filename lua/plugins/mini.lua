require("mini.basics").setup({
	options = {
		extra_ui = true,
	},
})

require("mini.cursorword").setup()
require("mini.icons").setup()
require("mini.ai").setup()
require("mini.surround").setup()
require("mini.move").setup()
require("mini.trailspace").setup()

MiniIcons.mock_nvim_web_devicons()

require("mini.splitjoin").setup({
	mappings = {
		toggle = "J",
	},
})

require("mini.files").setup({
	mappings = {
		go_in_plus = "l",
	},
	options = {
		use_as_default_explorer = false,
	},
})

require("mini.clue").setup({
	window = {
		delay = 0,
	},

	triggers = {
		{ mode = { "n", "x" }, keys = "<Leader>" },
		{ mode = "n", keys = "[" },
		{ mode = "n", keys = "]" },
		{ mode = "i", keys = "<C-x>" },
		{ mode = { "n", "x" }, keys = "g" },
		{ mode = { "n", "x" }, keys = "'" },
		{ mode = { "n", "x" }, keys = "`" },
		{ mode = { "n", "x" }, keys = '"' },
		{ mode = { "i", "c" }, keys = "<C-r>" },
		{ mode = "n", keys = "<C-w>" },
		{ mode = { "n", "x" }, keys = "z" },
	},

	clues = {
		require("mini.clue").gen_clues.square_brackets(),
		require("mini.clue").gen_clues.builtin_completion(),
		require("mini.clue").gen_clues.g(),
		require("mini.clue").gen_clues.marks(),
		require("mini.clue").gen_clues.registers(),
		require("mini.clue").gen_clues.windows(),
		require("mini.clue").gen_clues.z(),
	},
})

require("mini.pairs").setup({
	modes = { insert = true, command = false, terminal = false },
	mappings = {
		[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
		["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
		["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
		["["] = {
			action = "open",
			pair = "[]",
			neigh_pattern = '.[%s%z%<>")}%]]',
		},
		["{"] = {
			action = "open",
			pair = "{}",
			neigh_pattern = '.[%s%z%<>")}%]]',
		},
		["("] = {
			action = "open",
			pair = "()",
			neigh_pattern = '.[%s%z%")]',
		},
		['"'] = {
			action = "closeopen",
			pair = '""',
			neigh_pattern = "[^%w\\][^%w]",
			register = { cr = false },
		},
		["'"] = {
			action = "closeopen",
			pair = "''",
			neigh_pattern = "[^%w\\][^%w]",
			register = { cr = false },
		},
		["`"] = {
			action = "closeopen",
			pair = "``",
			neigh_pattern = "[^%w\\][^%w]",
			register = { cr = false },
		},
	},
})

vim.keymap.set("n", "<leader>e", function()
	MiniFiles.open()
end, { desc = "Explorer" })

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		MiniTrailspace.trim()
		MiniTrailspace.trim_last_lines()
	end,
})
