require "nvchad.mappings"

local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local cmp = require "cmp"
local has_supermaven, supermaven = pcall(require, "supermaven-nvim")

cmp.setup {
  mapping = cmp.mapping.preset.insert {
    ["<Tab>"] = cmp.mapping(function(fallback)
      fallback()
    end),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      fallback()
    end),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  },
}
if has_supermaven then
  supermaven.setup {
    keymaps = {
      accept = "<Tab>",
      accept_word = "<C-l>",
      accept_line = "<C-S-l>",
    },
  }
  vim.cmd [[
    autocmd FileType markdown,help lua require('supermaven-nvim').setup()
  ]]
end

keymap.set({ "n", "v", "o" }, "H", "^", opts)
keymap.set({ "n", "v", "o" }, "L", "$", opts)
keymap.set({ "n", "v", "o" }, "B", "<cmd>lua require('spider').motion('b')<cr>", opts)
keymap.set({ "n", "v", "o" }, "E", "<cmd>lua require('spider').motion('e')<cr>", opts)
keymap.set({ "n", "v", "o" }, "W", "<cmd>lua require('spider').motion('w')<cr>", opts)

-- Git
keymap.set("n", "<Leader>gb", ":Gitsigns toggle_current_line_blame<CR>")
keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>", opts)
keymap.set("n", "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", opts)
keymap.set("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", opts)
keymap.set("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", opts)
keymap.set("n", "<leader>gl", "<cmd>Git log --oneline --graph --decorate --all<cr>")
keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>")
keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>")
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")

keymap.set("n", "<c-_>", "gccj", { silent = true, expr = false })
keymap.set("v", "<c-_>", "gc", { silent = true, expr = false })
keymap.set("n", "<c-/>", "gccj", { silent = true, expr = false })
keymap.set("v", "<c-/>", "gc", { silent = true, expr = false })

keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")

-- Todo
keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>")
keymap.set("n", "<leader>tl", "<cmd>TodoLocList<cr>")

-- Jumps/Marks
keymap.set("n", "<leader>j", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap.set("n", "<leader>ja", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)

-- ADDITIONAL REQUESTED MAPPINGS
keymap.set("n", "nh", ":nohl<CR>", opts)
keymap.set("n", ";;", ":w<CR>", opts)
keymap.set("n", "x", '"_x', opts)
keymap.set("n", "dw", 'vb"_d', opts)
keymap.set("n", "sv", "<C-w>v", opts)
keymap.set("n", "sh", "<C-w>s", opts)
keymap.set("n", "se", "<C-w>=", opts)
keymap.set("n", "cl", ":bd<CR>", opts)
keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
keymap.set("n", "te", ":tabedit<CR>", opts)
keymap.set("n", "tl", ":tabnext<CR>", opts)
keymap.set("n", "th", ":tabprev<CR>", opts)
keymap.set("n", "<Space><Space>", "<C-w>w", opts)
keymap.set("n", "nt", ":Neotree filesystem reveal toggle left<CR>", {})
keymap.set("n", "ff", "<cmd>Telescope find_files<cr>", opts)
keymap.set("n", "fs", "<cmd>Telescope live_grep<cr>", opts)
keymap.set("n", "fb", "<cmd>Telescope buffers<cr>", opts)
keymap.set("n", "fh", "<cmd>Telescope help_tags<cr>", opts)
keymap.set("n", "<C-/>", function()
  require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })
keymap.set("x", "<C-/>", function()
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { noremap = true, silent = true })
keymap.set("v", "<C-A-l>", function()
  vim.lsp.buf.format { async = true }
end)
keymap.set("n", "rss", ":LspRestart<CR>", opts)

keymap.set("n", "<C-j>", function()
  vim.diagnostic.jump { count = 1 }
  vim.diagnostic.open_float { scope = "cursor", border = "rounded" }
end, vim.tbl_extend("force", opts, { desc = "Go to next diagnostic and show error" }))

keymap.set("n", "<C-k>", function()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result)
    if not result or vim.tbl_isempty(result) then
      print "No definition found!"
      return
    end
    local target = result[1] or result
    local uri = target.uri or target.targetUri
    local range = target.range or target.targetSelectionRange
    local current_uri = vim.uri_from_bufnr(0)
    if uri == current_uri then
      local row = range.start.line + 1
      local col = range.start.character + 1
      vim.api.nvim_win_set_cursor(0, { row, col })
    else
      vim.lsp.util.show_document(target, "utf-8")
    end
  end)
end, vim.tbl_extend("force", opts, { desc = "Go to definition in new buffer" }))
