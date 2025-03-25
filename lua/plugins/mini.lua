return {
	"echasnovski/mini.nvim",
	version = false,
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = function()
		require("mini.basics").setup({
			options = {
				extra_ui = true,
			},
		})

		require("mini.cursorword").setup()
		require("mini.trailspace").setup()
		require("mini.icons").setup()
		require("mini.ai").setup()
		require("mini.surround").setup()

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

		local gen_loader = require("mini.snippets").gen_loader
		require("mini.snippets").setup({
			snippets = {
				-- Load custom file with global snippets first (adjust for Windows)
				-- gen_loader.from_file('~/.config/nvim/snippets/global.json'),

				-- Load snippets based on current language by reading files from
				-- "snippets/" subdirectories from 'runtimepath' directories.
				gen_loader.from_lang(),
			},
		})

		-- https://gist.github.com/tmerse/dc21ec932860013e56882f23ee9ad8d2
		require("mini.pairs").setup({
			-- In which modes mappings from this `config` should be created
			modes = { insert = true, command = false, terminal = false },

			-- Global mappings. Each right hand side should be a pair information, a
			-- table with at least these fields (see more in |MiniPairs.map|):
			-- - <action> - one of 'open', 'close', 'closeopen'.
			-- - <pair> - two character string for pair to be used.
			-- By default pair is not inserted after `\`, quotes are not recognized by
			-- `<CR>`, `'` does not insert pair after a letter.
			-- Only parts of tables can be tweaked (others will use these defaults).
			mappings = {
				[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
				["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
				["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
				["["] = {
					action = "open",
					pair = "[]",
					neigh_pattern = '.[%s%z%<>")}%]]',
					-- foo|bar -> press "[" -> foo[bar
					-- foobar| -> press "[" -> foobar[]
					-- |foobar -> press "[" -> [foobar
					-- | foobar -> press "[" -> [] foobar
					-- foobar | -> press "[" -> foobar []
					-- {|} -> press "[" -> {[]}
					-- (|) -> press "[" -> ([])
					-- [|] -> press "[" -> [[]]
					-- "|" -> press "[" -> "[]"
				},
				["{"] = {
					action = "open",
					pair = "{}",
					-- neigh_pattern = ".[%s%z%)}]",
					neigh_pattern = '.[%s%z%<>")}%]]',
					-- foo|bar -> press "{" -> foo{bar
					-- foobar| -> press "{" -> foobar{}
					-- |foobar -> press "{" -> {foobar
					-- | foobar -> press "{" -> {} foobar
					-- foobar | -> press "{" -> foobar {}
					-- (|) -> press "{" -> ({})
					-- {|} -> press "{" -> {{}}
					-- "|" -> press "{" -> "{}"
				},
				["("] = {
					action = "open",
					pair = "()",
					-- neigh_pattern = ".[%s%z]",
					neigh_pattern = '.[%s%z%")]',
					-- foo|bar -> press "(" -> foo(bar
					-- foobar| -> press "(" -> foobar()
					-- |foobar -> press "(" -> (foobar
					-- | foobar -> press "(" -> () foobar
					-- foobar | -> press "(" -> foobar ()
				},
				-- Single quote: Prevent pairing if either side is a letter
				['"'] = {
					action = "closeopen",
					pair = '""',
					neigh_pattern = "[^%w\\][^%w]",
					register = { cr = false },
				},
				-- Single quote: Prevent pairing if either side is a letter
				["'"] = {
					action = "closeopen",
					pair = "''",
					neigh_pattern = "[^%w\\][^%w]",
					register = { cr = false },
				},
				-- Backtick: Prevent pairing if either side is a letter
				["`"] = {
					action = "closeopen",
					pair = "``",
					neigh_pattern = "[^%w\\][^%w]",
					register = { cr = false },
				},
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				MiniTrailspace.trim()
				MiniTrailspace.trim_last_lines()
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
