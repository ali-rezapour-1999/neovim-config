local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")

if not ok then
	return
end

local theme = require("theme")

local plugins = {
	theme.get_active_theme(),
	"mhinz/vim-startify",
	"kyazdani42/nvim-web-devicons",
	"onsails/lspkind.nvim",
	require("plugins.configs.bufferline"),
	"folke/which-key.nvim",
	require("plugins.configs.neoscroll"), 
	require("plugins.configs.ufo"),
	require("plugins.configs.trouble"),
	require("plugins.configs.aerial"),
	"rcarriga/nvim-notify",
	"mbbill/undotree",
	require("plugins.configs.neotree"),
	require("plugins.configs.lualine"),
	require("plugins.configs.treesitter"),
	require("plugins.configs.telescope"),
	"terryma/vim-expand-region",
	require("plugins.configs.autopairs"),
	require("plugins.configs.dial"),
	require("plugins.configs.surround"),
	require("plugins.configs.neoclip"), 
	require("plugins.configs.project"),
	"sitiom/nvim-numbertoggle", 
	"chrisgrieser/nvim-spider",
	require("plugins.configs.matchup"),
	require("plugins.configs.comment"),
	require("plugins.configs.flash"),
	require("plugins.configs.todo"),
	require("plugins.configs.harpoon"),
	require("plugins.configs.bigfile"),
	require("plugins.configs.splitjoin"), 
    "mg979/vim-visual-multi",
	---- Code
	require("plugins.configs.lspsaga"),
	require("plugins.configs.refactor"),
	require("plugins.configs.lens"),
	require("plugins.configs.conform"),

	---- LSP/DAP
	require("plugins.configs.mason"),
	"neovim/nvim-lspconfig",
    require("lsp.configs.dap"),
	require("lsp.configs.java"),

	---- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	require("plugins.configs.cmp"),
	require("plugins.configs.lspsignature"),
	---- Git
	require("plugins.configs.diffview"),
	require("plugins.configs.gitsigns"), 
	{ import = "lazyvim.plugins.extras.linting.eslint" },
	{ import = "lazyvim.plugins.extras.formatting.prettier" },
	{ import = "lazyvim.plugins.extras.lang.typescript" },
	{ import = "lazyvim.plugins.extras.lang.json" },
}

lazy.setup(plugins)
