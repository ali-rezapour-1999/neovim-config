return {
	{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
	{
	  "nvim-treesitter/nvim-treesitter",
	  opts = {
		ensure_installed = {
		  "bash",
		  "html",
		  "javascript",
		  "json",
		  "lua",
		  "markdown",
		  "markdown_inline",
		  "python",
		  "query",
		  "regex",
		  "tsx",
		  "typescript",
		  "vim",
		  "yaml",
		},
		highlight = {
		  enable = true, -- Enable syntax highlighting for all languages
		  additional_vim_regex_highlighting = false, -- Disable Vim's regex-based highlighting to avoid conflicts
		  -- Optional: Disable highlighting for specific languages if needed
		  -- disable = { "lua", "python" },
		},
		query_linter = {
		  enable = true,
		  use_virtual_text = true,
		  lint_events = { "BufWrite", "CursorHold" },
		},
		playground = {
		  enable = true,
		  disable = {},
		  updatetime = 25,
		  persist_queries = true,
		  keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		  },
		},
	  },
	  config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
		-- MDX filetype and language registration
		vim.filetype.add({
		  extension = {
			mdx = "mdx",
		  },
		})
		vim.treesitter.language.register("markdown", "mdx")
	  end,
	},
  }