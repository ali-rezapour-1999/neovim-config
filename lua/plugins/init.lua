return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
      local startify = require "alpha.themes.startify"
      startify.file_icons.provider = "devicons"
      require("alpha").setup(startify.config)
    end,
  },

  {
    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "astro",
          "cmake",
          "cpp",
          "css",
          "fish",
          "gitignore",
          "go",
          "graphql",
          "http",
          "java",
          "php",
          "rust",
          "scss",
          "sql",
          "svelte",
        },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { "BufWrite", "CursorHold" },
          autotag = {
            enable = true,
          },
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

        -- MDX
        vim.filetype.add {
          extension = {
            mdx = "mdx",
          },
        }
        vim.treesitter.language.register("markdown", "mdx")
      end,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup {
        keymaps = {
          accept = "<Tab>",
          accept_word = "<C-i>",
          accept_line = "<C-S-l>",
        },
      }
    end,
  },
}
