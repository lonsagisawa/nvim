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

local function statusline_content(is_active)
	local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 75 })
	mode = mode:sub(1, 3):upper()
	if not is_active then
		mode_hl = "MiniStatuslineInactive"
	end

	local aerial_loc = ""
	if is_active then
		local ok, aerial = pcall(require, "aerial")
		if ok then
			local symbols = aerial.get_location(true)
			local parts = {}
			for _, s in ipairs(symbols) do
				table.insert(parts, s.icon .. " " .. s.name)
			end
			aerial_loc = table.concat(parts, " > ")
		end
	end

	return MiniStatusline.combine_groups({
		{ hl = mode_hl, strings = { mode } },
		{
			hl = is_active and "MiniStatuslineDevinfo" or "MiniStatuslineInactive",
			strings = {
				MiniStatusline.section_git({ trunc_width = 40 }),
				MiniStatusline.section_diff({ trunc_width = 75 }),
				MiniStatusline.section_diagnostics({ trunc_width = 75 }),
				MiniStatusline.section_lsp({ trunc_width = 75 }),
			},
		},
		"%<",
		{
			hl = is_active and "MiniStatuslineFilename" or "MiniStatuslineInactive",
			strings = { aerial_loc },
		},
		"%=",
		{ hl = "MiniStatuslineFileinfo", strings = { "" } },
		{
			hl = mode_hl,
			strings = {
				MiniStatusline.section_location({ trunc_width = 999999999 }),
			},
		},
	})
end

require("mini.statusline").setup({
	content = {
		active = function() return statusline_content(true) end,
		inactive = function() return statusline_content(false) end,
	},
})

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

vim.keymap.set({ "n", "x" }, "<leader>du", "<cmd>DepsUpdate<cr>", { desc = "Update plugins" })
vim.keymap.set({ "n", "x" }, "<leader>dc", "<cmd>DepsClean<cr>", { desc = "Cleanup unused plugins" })
