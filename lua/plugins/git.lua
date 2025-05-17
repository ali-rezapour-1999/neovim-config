return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "" },
          change = { text = "" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "" },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 300,
          ignore_whitespace = true,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      })
    end,
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
