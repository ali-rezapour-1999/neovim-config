local active_buffers_per_tab = {}

local function get_buffers_in_tab(tabpage)
  local wins = vim.api.nvim_tabpage_list_wins(tabpage)
  local bufs = {}
  for _, win in ipairs(wins) do
    local buf = vim.api.nvim_win_get_buf(win)
    bufs[buf] = true
  end
  return bufs
end
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "WinEnter" }, {
    callback = function()
      local tab = vim.api.nvim_get_current_tabpage()
      local bufs = get_buffers_in_tab(tab)
      active_buffers_per_tab[tab] = vim.tbl_extend("force", active_buffers_per_tab[tab] or {}, bufs)
    end,
  })


return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        numbers = "ordinal",
        diagnostics = true,
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and "" or ""
          return " " .. icon .. count
        end,
        modified_icon = "●",
        buffer_close_icon = "",
        show_buffer_close_icons = true,
        show_close_icon = false,
        always_show_bufferline = false,
        separator_style = "thin",
        name_formatter = function(buf)
          return buf.name ~= "" and buf.name or "No Name"
        end,
        custom_filter = function(buf_number)
          local tab = vim.api.nvim_get_current_tabpage()
          local valid = vim.api.nvim_buf_is_valid(buf_number)
          local listed = vim.api.nvim_buf_get_option(buf_number, "buflisted")
          local active_bufs = active_buffers_per_tab[tab] or {}
          return valid and listed and active_bufs[buf_number]
        end,
        offsets = {
          { filetype = "NvimTree", text = "File Explorer", separator = true },
        },
      },
      highlights = {
        buffer_selected = { bold = true },
        separator = { fg = "#444444" },
        separator_selected = { fg = "#444444" },
      },
    },
  },
  {
    "echasnovski/mini.hipatterns",
    event = "BufReadPre",
    opts = {
      highlighters = {
        hsl_color = {
          pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)",
          group = function(_, match)
            local utils = require("solarized-osaka.hsl")
            local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)")
            local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
            local hex_color = utils.hslToHex(h, s, l)
            return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
          end,
        },
      },
    },
  }
}
