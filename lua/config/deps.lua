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

local add = MiniDeps.add

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

local function is_mini_core(source)
	return source == "nvim-mini/mini.nvim"
end

local function wrap_build(build)
	if type(build) ~= "function" then
		return nil
	end
	return function(hook)
		if hook and hook.name then
			pcall(vim.cmd, "packadd " .. hook.name)
		end
		build(hook)
	end
end

local function to_dep_spec(dep)
	if type(dep) == "string" then
		if is_mini_core(dep) then
			return nil
		end
		return { source = dep }
	end
	if type(dep) ~= "table" then
		return nil
	end
	local source = dep.source or dep[1]
	if not source or is_mini_core(source) then
		return nil
	end

	local out = { source = source }
	if dep.name then
		out.name = dep.name
	end

	local checkout = dep.checkout or dep.branch or dep.tag or dep.commit
	if checkout then
		out.checkout = checkout
	end

	local deps = dep.dependencies or dep.depends
	if type(deps) == "table" then
		local items = {}
		for _, child in ipairs(deps) do
			local child_spec = to_dep_spec(child)
			if child_spec then
				table.insert(items, child_spec)
			end
		end
		if #items > 0 then
			out.depends = items
		end
	end

	local build_hook = wrap_build(dep.build)
	if build_hook then
		out.hooks = out.hooks or {}
		out.hooks.post_install = build_hook
		out.hooks.post_checkout = build_hook
	end

	return out
end

local function to_entry(spec)
	if type(spec) == "string" then
		return { source = spec, mini_spec = { source = spec } }
	end
	if type(spec) ~= "table" then
		return nil
	end

	local source = spec.source or spec[1]
	if not source then
		return nil
	end

	local mini_spec = { source = source }
	if spec.name then
		mini_spec.name = spec.name
	end

	local checkout = spec.checkout or spec.branch or spec.tag or spec.commit
	if checkout then
		mini_spec.checkout = checkout
	end

	local deps = spec.dependencies or spec.depends
	if type(deps) == "table" then
		local items = {}
		for _, dep in ipairs(deps) do
			local dep_spec = to_dep_spec(dep)
			if dep_spec then
				table.insert(items, dep_spec)
			end
		end
		if #items > 0 then
			mini_spec.depends = items
		end
	end

	local build_hook = wrap_build(spec.build)
	if build_hook then
		mini_spec.hooks = mini_spec.hooks or {}
		mini_spec.hooks.post_install = build_hook
		mini_spec.hooks.post_checkout = build_hook
	end

	return {
		source = source,
		mini_spec = mini_spec,
		init = spec.init,
		config = spec.config,
		opts = spec.opts,
		keys = spec.keys,
		module = spec.main or spec.name,
	}
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
				local entry = to_entry(item)
				if entry then
					table.insert(entries, entry)
				end
			end
		else
			vim.notify(
				"mini.deps: failed to load " .. module_name .. ": " .. tostring(spec),
				vim.log.levels.ERROR
			)
		end
	end

	table.insert(entries, {
		source = "MunifTanjim/nui.nvim",
		mini_spec = { source = "MunifTanjim/nui.nvim" },
	})

	return entries
end

local entries = collect_entries()

for _, entry in ipairs(entries) do
	if not is_mini_core(entry.source) then
		add(entry.mini_spec)
	end
end

for _, entry in ipairs(entries) do
	run_config(entry)
end

vim.keymap.set({ "n", "x" }, "<leader>ll", "<cmd>DepsUpdate<cr>", { desc = "Update plugins" })
