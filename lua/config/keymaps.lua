local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<ESC>", opts)
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
keymap.set("n", "<Space>", "<C-w>w", opts)
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
keymap.set("n", "<leader>gl", "<cmd>Git log --oneline --graph --decorate --all<cr>")
keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>")
keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>")
keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")
keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>")
keymap.set("n", "<leader>tl", "<cmd>TodoLocList<cr>")
keymap.set("v", "<C-A-l>", function()
  vim.lsp.buf.format({ async = true })
end)
keymap.set("n", "rss", ":LspRestart<CR>", opts)
keymap.set("n", "fy", "<cmd>Telescope yank_history<CR>", { desc = "Yank History" })
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
keymap.set("n", "<C-k>", function()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result, _, _)
    if not result or vim.tbl_isempty(result) then
      print("No definition found!")
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
      vim.cmd("tabedit")
      vim.lsp.util.jump_to_location(target, "utf-8")
    end
  end)
end, { noremap = true, silent = true, desc = "Go to definition in a new tab" })
