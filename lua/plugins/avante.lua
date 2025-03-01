return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false,
	opts = {
		-- Providers: gemini, gemini_lite, groq, pplx, ollama
		provider = "gemini",
		gemini = {
			model = "gemini-2.0-flash",
			max_tokens = 8192,
		},
		vendors = {
			gemini_lite = {
				__inherited_from = "gemini",
				model = "gemini-2.0-flash-lite",
				max_tokens = 8192,
			},
			ollama = {
				__inherited_from = "openai",
				api_key_name = "",
				endpoint = "http://127.0.0.1:11434/v1",
				model = "qwen2.5-coder:7b",
			},
			groq = {
				__inherited_from = "openai",
				api_key_name = "GROQ_API_KEY",
				endpoint = "https://api.groq.com/openai/v1",
				-- model = "llama-3.3-70b-versatile",
				model = "deepseek-r1-distill-llama-70b",
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
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
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
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
