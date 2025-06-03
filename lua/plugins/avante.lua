return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false,
	build = "make",
	-- Windows
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false",
	opts = {
		-- Providers: gemini, gemini-2.5-pro, openai(gpt-4.1-nano)
		provider = "gemini",
		cursor_applying_provider = "gpt-4.1-nano",
		behaviour = {
			enable_cursor_planning_mode = true,
		},

		system_prompt = function()
			local hub = require("mcphub").get_hub_instance()
			return hub:get_active_servers_prompt()
		end,

		custom_tools = function()
			return {
				require("mcphub.extensions.avante").mcp_tool(),
			}
		end,

		disabled_tools = {
			"list_files",
			"search_files",
			"read_file",
			"create_file",
			"rename_file",
			"delete_file",
			"create_dir",
			"rename_dir",
			"delete_dir",
			"bash",
		},

		providers = {
			openai = {
				model = "gpt-4.1",
				max_tokens = 32768,
			},

			gemini = {
				model = "gemini-2.5-flash-preview-05-20",
				extra_request_body = {
					max_tokens = 65536,
				},
			},

			vendors = {
				["gemini-2.5-pro"] = {
					__inherited_from = "gemini",
					model = "gemini-2.5-pro-preview-05-06",
					extra_request_body = {
						max_tokens = 65536,
					},
				},

				["gpt-4.1-nano"] = {
					__inherited_from = "openai",
					model = "gpt-4.1-nano",
					max_tokens = 32768,
				},

				groq = {
					__inherited_from = "openai",
					api_key_name = "GROQ_API_KEY",
					endpoint = "https://api.groq.com/openai/v1/",
					model = "llama-3.3-70b-versatile",
					max_completion_tokens = 32768,
				},
			},
		},

		file_selector = {
			provider = "snacks",
		},
	},
	dependencies = {
		"stevearc/dressing.nvim",
		"MunifTanjim/nui.nvim",
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
	},
}
