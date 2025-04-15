return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	lazy = false,
	config = function()
		require("illuminate").configure({
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			filetypes_denylist = {
				"NeoTree",
				"toggleterm",
				"TelescopePrompt",
			},

			delay = 200,
			large_file_cutoff = 500,
			large_file_overrides = nil,
		})
	end,
}
