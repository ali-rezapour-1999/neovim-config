return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
		})
		vim.api.nvim_set_keymap("n", "<c-_>", "gccj", { silent = true, expr = false })
        vim.api.nvim_set_keymap("v", "<c-_>", "gc", { silent = true, expr = false })
        -- Out of tmux
		vim.api.nvim_set_keymap("n", "<c-/>", "gccj", { silent = true, expr = false })
        vim.api.nvim_set_keymap("v", "<c-/>", "gc", { silent = true, expr = false })
	end,
}
