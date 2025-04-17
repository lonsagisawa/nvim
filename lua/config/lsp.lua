local blink_capabilities = require("blink.cmp").get_lsp_capabilities()

function mergeTables(t1, t2)
	local result = {}
	for i = 1, #t1 do
		result[#result + 1] = t1[i]
	end
	for i = 1, #t2 do
		result[#result + 1] = t2[i]
	end
	return result
end

local servers = {
	"astro",
	"cssls",
	"css_variables",
	"cssmodules_ls",
	"docker_compose_language_service",
	"dockerls",
	"html",
	"intelephense",
	"lua_ls",
	"marksman",
	"svelte",
	"vtsls",
	"volar",
}

-- https://github.com/neovim/nvim-lspconfig/issues/3705
local legacy_servers = {
	"tailwindcss",
	"unocss",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = mergeTables(servers, legacy_servers),
})

vim.lsp.config("html", {
	filetypes = { "html", "blade" },
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.lsp.config("vtsls", {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	settings = {
		vtsls = { tsserver = { globalPlugins = {} } },
	},
	before_init = function(params, config)
		local result = vim.system({ "npm", "query", "#vue" }, { cwd = params.workspaceFolders[1].name, text = true })
			:wait()
		if result.stdout ~= "[]" then
			local vuePluginConfig = {
				name = "@vue/typescript-plugin",
				location = require("mason-registry").get_package("vue-language-server"):get_install_path()
					.. "/node_modules/@vue/language-server",
				languages = { "vue" },
				configNamespace = "typescript",
				enableForWorkspaceTypeScriptVersions = true,
			}
			table.insert(config.settings.vtsls.tsserver.globalPlugins, vuePluginConfig)
		end
	end,
})

vim.lsp.config("volar", {
	init_options = {
		typescript = {
			tsdk = require("mason-registry").get_package("vtsls"):get_install_path()
				.. "/node_modules/@vtsls/language-server/node_modules/typescript/lib",
		},
	},
	on_new_config = function(new_config, new_root_dir)
		local lib_path = vim.fs.find("node_modules/typescript/lib", { path = new_root_dir, upward = true })[1]
		if lib_path then
			new_config.init_options.typescript.tsdk = lib_path
		end
	end,
})

vim.lsp.enable(servers)

for _, server_name in ipairs(legacy_servers) do
	require("lspconfig")[server_name].setup({
		capabilities = blink_capabilities,
	})
end

vim.lsp.enable({
	"laravel-ls",
})

-- 読み込み中にくるくる回るアレ
-- https://github.com/folke/snacks.nvim/blob/main/docs/notifier.md#-examples
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
		if not client or type(value) ~= "table" then
			return
		end
		local p = progress[client.id]

		for i = 1, #p + 1 do
			if i == #p + 1 or p[i].token == ev.data.params.token then
				p[i] = {
					token = ev.data.params.token,
					msg = ("[%3d%%] %s%s"):format(
						value.kind == "end" and 100 or value.percentage or 100,
						value.title or "",
						value.message and (" **%s**"):format(value.message) or ""
					),
					done = value.kind == "end",
				}
				break
			end
		end

		local msg = {} ---@type string[]
		progress[client.id] = vim.tbl_filter(function(v)
			return table.insert(msg, v.msg) or not v.done
		end, p)

		local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
		vim.notify(table.concat(msg, "\n"), "info", {
			id = "lsp_progress",
			title = client.name,
			opts = function(notif)
				notif.icon = #progress[client.id] == 0 and " "
					or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
			end,
		})
	end,
})
