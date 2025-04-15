return {
	-- Project management
	"ahmedkhalf/project.nvim",
	lazy = true,
	dependencies = "nvim-telescope/telescope.nvim",
	config = function()
		require("project_nvim").setup({
			detection_methods = {},
		})
		require("telescope").load_extension("projects")
	end,
}
