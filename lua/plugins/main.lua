return {

  -- {
  --   "navarasu/onedark.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("onedark").setup({
  --       style = "deep",
  --     })
  --     require("onedark").load()
  --   end,
  -- },
  --
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
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized-osaka",
    },
  },

  {
    enabled = false,
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {
      search = {
        forward = true,
        multi_window = false,
        wrap = false,
        incremental = true,
      },
    },
  },
  {
    "echasnovski/mini.hipatterns",
    event = "BufReadPre",
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.linting.eslint" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.editor.refactoring" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.ui.mini-animate" },

  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "VeryLazy",
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "buffers",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
      highlights = {
        buffer_selected = {
          underline = true,
          sp = "#ff0000",
          italic = false,
          bold = false,
        },
        diagnostic_selected = {
          underline = true,
          sp = "#ff0000",
        },
        hint_selected = {
          underline = true,
          sp = "#ff0000",
        },
        info_selected = {
          underline = true,
          sp = "#ff0000",
        },
        warning_selected = {
          underline = true,
          sp = "#ff0000",
        },
        error_selected = {
          underline = true,
          sp = "#ff0000",
        },
      },
    },
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    ---@module "neo-tree"
    ---@type neotree.Config?
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function() end,
    keys = {
      { "gl", ":LazyGit<CR>", desc = "Open Lazygit" },
    },
    cmd = "LazyGit",
  },
  {
    "dinhhuy258/git.nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {
        blame = "<Leader>gm",
        browse = "<Leader>go",
      },
    },
  },
}
