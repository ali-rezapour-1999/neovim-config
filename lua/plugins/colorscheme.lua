return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
			}
		end,
	},
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("onedark").setup({
	-- 			style = "warmer",
	-- 			transparent = true,
	-- 			term_colors = true,
	-- 			ending_tildes = false,
	-- 			cmp_itemkind_reverse = false,
	-- 			toggle_style_key = nil,
	-- 			toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },
	-- 		})
	-- 		require("onedark").load()
	-- 	end,
	-- },
}
