local data_path = vim.fn.stdpath("data")
local package_path = data_path .. "/site"
local mini_path = package_path .. "/pack/deps/start/mini.nvim"
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

vim.opt.rtp:prepend(mini_path)

require("mini.deps").setup({
	path = {
		package = package_path,
	},
})

local function normalize_specs(spec)
	if spec == nil then
		return {}
	end
	if vim.islist(spec) then
		return spec
	end
	return { spec }
end

local function module_from_source(source)
	if type(source) ~= "string" then
		return nil
	end
	local name = source:match("/([^/]+)$") or source
	return name:gsub("%.nvim$", "")
end

local function apply_keys(keys)
	if type(keys) ~= "table" then
		return
	end
	for _, key in ipairs(keys) do
		local lhs = key[1]
		local rhs = key[2]
		if lhs ~= nil and rhs ~= nil and rhs ~= false then
			local mode = key.mode
			if mode == nil then
				mode = "n"
			end

			local opts = {}
			if key.desc ~= nil then
				opts.desc = key.desc
			end
			if key.expr ~= nil then
				opts.expr = key.expr
			end
			if key.silent ~= nil then
				opts.silent = key.silent
			end
			if key.nowait ~= nil then
				opts.nowait = key.nowait
			end
			if key.noremap ~= nil then
				opts.noremap = key.noremap
			end
			if key.remap ~= nil then
				opts.remap = key.remap
			end
			if key.buffer ~= nil then
				opts.buffer = key.buffer
			end

			vim.keymap.set(mode, lhs, rhs, opts)
		end
	end
end

local function run_config(entry)
	if type(entry.init) == "function" then
		entry.init()
	end

	local opts = entry.opts
	if type(entry.config) == "function" then
		entry.config(entry, opts)
	elseif opts ~= nil then
		local module_name = entry.module or module_from_source(entry.source)
		if module_name then
			local ok, mod = pcall(require, module_name)
			if ok then
				if type(mod.setup) == "function" then
					mod.setup(opts)
				elseif type(mod) == "function" then
					mod(opts)
				end
			else
				vim.notify(
					"mini.deps: failed to load " .. module_name .. ": " .. tostring(mod),
					vim.log.levels.WARN
				)
			end
		end
	end

	apply_keys(entry.keys)
end

local function collect_entries()
	local entries = {}
	local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
	local modules = {}

	for name, type_ in vim.fs.dir(plugin_dir) do
		if type_ == "file" and name:sub(-4) == ".lua" then
			table.insert(modules, "plugins." .. name:gsub("%.lua$", ""))
		end
	end

	table.sort(modules)

	for _, module_name in ipairs(modules) do
		local ok, spec = pcall(require, module_name)
		if ok then
			for _, item in ipairs(normalize_specs(spec)) do
				if type(item) == "table" then
					table.insert(entries, item)
				end
			end
		else
			vim.notify(
				"mini.deps: failed to load " .. module_name .. ": " .. tostring(spec),
				vim.log.levels.ERROR
			)
		end
	end

	return entries
end

local entries = collect_entries()

for _, entry in ipairs(entries) do
	run_config(entry)
end

vim.keymap.set({ "n", "x" }, "<leader>ll", "<cmd>DepsUpdate<cr>", { desc = "Update plugins" })
