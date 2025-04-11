return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = false,
      },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
    opts = function()
      local logo = [[
   __    __    ____  ____   ___ 
  /__\  (  )  (_  _)(  _ \ / __)
 /(__)\  )(__  _)(_  )   /( (_-.
(__)(__)(____)(____)(_)\_) \___/
    ]]
      local opts = {
        theme = "hyper",
        shortcut_type = "number", -- Enables number-based selection
        config = {
          header = vim.split(logo, "\n"),
          shortcut = {
            { desc = " Find File", group = "Label", action = "lua LazyVim.pick()()", key = "f" },
            { desc = " New File", group = "Label", action = "ene | startinsert", key = "t" },
            { desc = " Recent Files", group = "Label", action = 'lua LazyVim.pick("oldfiles")()', key = "r" },
            { desc = " Find Text", group = "Label", action = 'lua LazyVim.pick("live_grep")()', key = "g" },
            { desc = " Config", group = "Label", action = "lua LazyVim.pick.config_files()()", key = "c" },
            {
              desc = " Restore Session",
              group = "Label",
              action = 'lua require("persistence").load()()',
              key = "s",
            },
            { desc = " Lazy Extras", group = "Label", action = "LazyExtras", key = "x" },
            { desc = "󰒲 Lazy", group = "Label", action = "Lazy", key = "l" },
            {
              desc = " Quit",
              group = "Label",
              action = function()
                vim.api.nvim_input("<cmd>qa<cr>")
              end,
              key = "q",
            },
          },
          packages = { enable = true },
          project = {
            enable = true,
            limit = 8,
            icon = " ",
            label = "Projects",
            action = "Telescope find_files cwd=",
          },
          mru = { enable = true, limit = 10, icon = " ", label = "Recent Files", cwd_only = false },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end

      return opts
    end,
  },
}
