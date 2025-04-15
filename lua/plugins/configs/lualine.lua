return {
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" }, -- For icons
      opts = function()
        return {
          options = {
            icons_enabled = true,
            theme = "auto", -- Use colors from solarized_osaka
            disabled_filetypes = {},
            always_divide_middle = true,
            globalstatus = true,
          },
          sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff" },
            lualine_c = { "filename", "aerial" },
            lualine_x = {
              {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = { error = "E ", warn = "W ", info = "I ", hint = "H " },
              },
              "encoding",
              "filetype",
            },
            lualine_y = { "progress" },
            lualine_z = { "location" },
          },
        }
      end,
    },
  }