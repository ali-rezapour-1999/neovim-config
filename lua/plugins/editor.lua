return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          winblend = vim.o.pumblend,
        },
      },
      signature = {
        window = {
          winblend = vim.o.pumblend,
        },
      },
    },
  },

  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        mode = "workspace_diagnostics",
        "document_diagnostics",
        "quickfix",
        "lsp_references",
        "loclist",
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-frecency.nvim",
      "jvgrootveld/telescope-zoxide",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "<leader>fw",
        function()
          local word = vim.fn.expand("<cword>")
          require("telescope.builtin").grep_string({
            search = word,
            only_sort_text = true,
            path_display = { "shorten" },
            cwd = vim.fn.getcwd(),
          })
        end,
        desc = "Grep word under cursor",
      },
      {
        ";r",
        function()
          require("telescope.builtin").resume()
        end,
        desc = "Resume last Telescope picker",
      },
      {
        ";b",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Search buffers",
      },
      {
        "nn",
        function()
          local telescope = require("telescope")
          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end
          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 30, width = 110 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = telescope.extensions.file_browser.actions

      telescope.setup({
        picker = {
          hidden = true,
        },
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--no-ignore",
            "--smart-case",
            "--hidden",
          },
          file_ignore_patterns = {
            ".git/",
            ".settings/",
            ".metadata/",
            "target/",
            "node_modules/",
            ".class$",
            "dist/",
            ".png",
            "package-lock.json",
          },
          mappings = {
            i = {
              ["<C-j>"] = false,
              ["<C-k>"] = false,
            },
            n = {},
          },
          wrap_results = true,
          layout_strategy = "horizontal",
          layout_config = {
            prompt_position = "top",
            preview_cutoff = 120,
          },
          sorting_strategy = "ascending",
          winblend = 0,
          prompt_prefix = "   ",
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "truncate" },
          color_devicons = true,
          use_less = true,
          set_env = { ["COLORTERM"] = "truecolor" },
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        },
        pickers = {
          diagnostics = {
            theme = "ivy",
            initial_mode = "normal",
            layout_config = {
              preview_cutoff = 9999,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          frecency = {
            default_workspace = "CWD",
            show_scores = true,
            show_unindexed = true,
            disable_devicons = false,
            ignore_patterns = {
              "*.git/*",
              "*/tmp/*",
              "*/lua-language-server/*",
            },
          },
          file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
            mappings = {
              ["n"] = {
                ["N"] = fb_actions.create,
                ["h"] = fb_actions.goto_parent_dir,
                ["/"] = function()
                  vim.cmd("startinsert")
                end,
                ["<C-u>"] = function(prompt_bufnr)
                  for i = 1, 10 do
                    actions.move_selection_previous(prompt_bufnr)
                  end
                end,
                ["<C-d>"] = function(prompt_bufnr)
                  for i = 1, 10 do
                    actions.move_selection_next(prompt_bufnr)
                  end
                end,
                ["<C-b>"] = actions.preview_scrolling_up,
                ["<C-f>"] = actions.preview_scrolling_down,
              },
            },
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("frecency")
      telescope.load_extension("zoxide")
      telescope.load_extension("file_browser")
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({})
      vim.api.nvim_set_keymap("n", "<c-_>", "gccj", { silent = true, expr = false })
      vim.api.nvim_set_keymap("v", "<c-_>", "gc", { silent = true, expr = false })
      vim.api.nvim_set_keymap("n", "<c-/>", "gccj", { silent = true, expr = false })
      vim.api.nvim_set_keymap("v", "<c-/>", "gc", { silent = true, expr = false })
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "ThePrimeagen/harpoon",
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },

  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
    keys = {},
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},
  {
		"echasnovski/mini.bracketed",
		event = "BufReadPost",
		config = function()
			local bracketed = require("mini.bracketed")
			bracketed.setup({
				file = { suffix = "" },
				window = { suffix = "" },
				quickfix = { suffix = "" },
				yank = { suffix = "" },
				treesitter = { suffix = "n" },
			})
		end,
	},
}
