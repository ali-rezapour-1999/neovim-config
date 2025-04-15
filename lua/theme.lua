local M = {}

local themes = {
  onedark = {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup {
        style = "deep",
        transparent = false,
        code_style = {
          comments = "italic",
          keywords = "none",
          functions = "none",
          strings = "none",
          variables = "none",
        },
      }
      vim.cmd [[colorscheme onedark]]
    end,
  },
  onedarkpro = {
    "olimorris/onedarkpro.nvim",
    config = function()
      vim.o.background = "dark"
      require("onedarkpro").setup {}
      vim.cmd [[colorscheme onedarkpro]]
    end,
  },
  solarized_osaka = {
    "craftzdog/solarized-osaka.nvim",
    config = function()
      require("solarized-osaka").setup {
        transparent = true,
      }
      vim.cmd [[colorscheme solarized-osaka]]
    end,
  },
}

M.set_active_theme = function(theme_name)
  if themes[theme_name] then
    M.theme_name = theme_name
  else
    vim.notify("Theme '" .. theme_name .. "' not found", vim.log.levels.WARN)
  end
end

M.get_active_theme = function()
  local theme_name = M.theme_name or "solarized-osaka" -- Default to onedark if unset
  local theme = themes[theme_name]
  if not theme then
    vim.notify("Theme '" .. theme_name .. "' not found, using default", vim.log.levels.WARN)
    theme = themes["solarized-osaka"]
  end
  return vim.tbl_extend("force", theme, {
    lazy = false,
    priority = 1000,
  })
end

return M