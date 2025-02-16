require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"astro",
		"cssls",
		"css_variables",
		"cssmodules_ls",
		"docker_compose_language_service",
		"dockerls",
		"eslint",
		"html",
		"intelephense",
		"lua_ls",
		"marksman",
		"svelte",
		"tailwindcss",
		"unocss",
		"vtsls",
		"volar",
	},
})

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup {}
	end,

	["vtsls"] = function()
		require("lspconfig").vtsls.setup({
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			settings = {
				vtsls = { tsserver = { globalPlugins = {} } },
			},
			before_init = function(params, config)
				local result = vim.system(
					{ "npm", "query", "#vue" },
					{ cwd = params.workspaceFolders[1].name, text = true }
				):wait()
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
	end,

	["lua_ls"] = function()
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" }
					}
				}
			}
		})
	end,
})
