if true then
  return {}
end

return {
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
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return "😄"
        end,
      })
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

        vim.filetype.add({
          extension = {
            mdx = "mdx",
          },
        })
        vim.treesitter.language.register("markdown", "mdx")
      end,
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enable = false,
          sign = true,
          debounce = 10,
          virtual_text = true,
          sign_priority = 40,
        },
        symbol_in_winbar = {
          enable = false,
          separator = " › ",
          hide_keyword = false,
          ignore_patterns = nil,
          show_file = true,
          folder_level = 1,
          color_mode = true,
          dely = 300,
        },
      })
    end,
  },
}
