return {
    {	"lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = {
                        text = "+",
                    },
                    change = {
                        text = "~",
                    },
                    delete = {
                        text = "_",
                    },
                    topdelete = {
                        text = "‾",
                    },
                    changedelete = {
                        text = "~",
                    },
                },
            })
        end},
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
                blame = "<Leader>gb",
                browse = "<Leader>go",
              },
            },
          },
    }