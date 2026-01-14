local path_package = vim.fn.stdpath("data") .. "/site"
local mini_path = path_package .. "/pack/deps/start/mini.nvim"
local uv = vim.uv or vim.loop

if not uv.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		'git', 'clone', '--filter=blob:none',
		'https://github.com/nvim-mini/mini.nvim', mini_path
	}
	vim.fn.system(clone_cmd)
	vim.cmd('packadd mini.nvim | helptags ALL')
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require("mini.deps").setup()

local function load_plugins()
	local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
	local modules = {}

	for name, type_ in vim.fs.dir(plugin_dir) do
		if type_ == "file" and name:sub(-4) == ".lua" then
			table.insert(modules, "plugins." .. name:gsub("%.lua$", ""))
		end
	end

	table.sort(modules)

	for _, module_name in ipairs(modules) do
		pcall(require, module_name)
	end
end

load_plugins()

vim.keymap.set({ "n", "x" }, "<leader>du", "<cmd>DepsUpdate<cr>", { desc = "Update plugins" })
vim.keymap.set({ "n", "x" }, "<leader>dc", "<cmd>DepsClean<cr>", { desc = "Cleanup unused plugins" })
