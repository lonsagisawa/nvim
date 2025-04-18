return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false,
	build = "make",
	-- Windows
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false",
	opts = {
		-- Providers: gemini, groq_llama3.3, pplx, ollama
		provider = "gemini",
		cursor_applying_provider = "groq_llama3.3",
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

		gemini = {
			model = "gemini-2.0-flash",
			max_tokens = 8192,
		},

		vendors = {
			["gemini-2.5-flash-preview"] = {
				__inherited_from = "gemini",
				model = "gemini-2.5-flash-preview-04-17",
				max_tokens = 65536,
			},
			gemini_lite = {
				__inherited_from = "gemini",
				model = "gemini-2.0-flash-lite",
				max_tokens = 8192,
			},
			gemini_pro = {
				__inherited_from = "gemini",
				model = "gemini-2.5-pro-preview-03-25",
				max_tokens = 65536,
			},
			["groq_llama3.3"] = {
				__inherited_from = "openai",
				api_key_name = "GROQ_API_KEY",
				endpoint = "https://api.groq.com/openai/v1",
				model = "llama-3.3-70b-versatile",
				max_tokens = 32768,
			},
			["groq_qwq"] = {
				__inherited_from = "openai",
				api_key_name = "GROQ_API_KEY",
				endpoint = "https://api.groq.com/openai/v1",
				model = "qwen-qwq-32b",
				max_tokens = 32768,
			},
			pplx = {
				__inherited_from = "openai",
				api_key_name = "PPLX_API_KEY",
				endpoint = "https://api.perplexity.ai",
				-- R1 1776 model
				-- https://docs.perplexity.ai/guides/model-cards
				model = "r1-1776",
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
