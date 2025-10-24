return {
	settings = {
		intelephense = {
			files = {
				exclude = {
					"**/.git/**",
					"**/node_modules/**",
					"**/storage/debugbar/**",
					"**/storage/framework/**",
					"**/storage/logs/**",
				},
				maxSize = 5000000,
			},
			maxMemory = 4096,
		},
	},
	flags = { debounce_text_changes = 200 },
}
