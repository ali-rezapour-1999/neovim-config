local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- MULTIPLE MODES MAPPINGS
keymap.set({ "n", "v", "o" }, "H", "^", { desc = "[MOTION] Move to first character of line", noremap = true, silent = true })
keymap.set({ "n", "v", "o" }, "L", "$", { desc = "[MOTION] Move to last character of line", noremap = true, silent = true })
keymap.set({ "n", "v", "o" }, "B", "<cmd>lua require('spider').motion('b')<cr>", { desc = "[MOTION] Spider-b motion", noremap = true, silent = true })
keymap.set({ "n", "v", "o" }, "E", "<cmd>lua require('spider').motion('e')<cr>", { desc = "[MOTION] Spider-e motion", noremap = true, silent = true })
keymap.set({ "n", "v", "o" }, "W", "<cmd>lua require('spider').motion('w')<cr>", { desc = "[MOTION] Spider-w motion", noremap = true, silent = true })
keymap.set({ "n", "v", "o" }, "<c-s>", "ggOG", { desc = "[SELECT] Select all", noremap = true, silent = false })
keymap.set("n", "c", '"_c', { desc = "Do not copy when changing", noremap = true, silent = true })
keymap.set("n", "C", '"_C', { desc = "Do not copy when changing", noremap = true, silent = true })
keymap.set("n", "cc", '"_cc', { desc = "Do not copy when changing", noremap = true, silent = true })
keymap.set("n", "<a-p>", '"_diwP', { desc = "Replace word with paste", noremap = true, silent = true })
keymap.set("n", "<a-s-p>", '"_ddP', { desc = "Replace line with paste", noremap = true, silent = true })
keymap.set("n", "<a-j>", ":m .+1<cr>==", { desc = "Move line down", noremap = true, silent = true })
keymap.set("n", "<a-k>", ":m .-2<cr>==", { desc = "Move line up", noremap = true, silent = true })
keymap.set("n", "<a-d>", '"_diw', { desc = "Delete word", noremap = true, silent = true })
keymap.set("n", "<a-c>", '"_ciw', { desc = "Change word", noremap = true, silent = true })
keymap.set("n", "<a-s-d>", '<cmd>lua require("various-textobjs").subword(true)<cr>"_d', { desc = "Delete subword", noremap = true, silent = true })
keymap.set("n", "<a-a>", '<cmd>TSTextobjectSelect @parameter.inner<cr>"_c', { desc = "Change function parameter", noremap = true, silent = true })
keymap.set("n", "<a-s>", '<cmd>TSTextobjectSelect @parameter.outer<cr>"_d', { desc = "Delete function parameter", noremap = true, silent = true })
keymap.set("n", "<a-o>", "mao<ESC>`a", { desc = "New line in normal mode", noremap = true, silent = true })
keymap.set("n", "<a-O>", "maO<ESC>`a", { desc = "New line before in normal mode", noremap = true, silent = true })
keymap.set("n", "<c-d>", "<c-d>zz", { desc = "Keep cursor in the middle while scrolling down", noremap = true, silent = true })
keymap.set("n", "<c-u>", "<c-u>zz", { desc = "Keep cursor in the middle while scrolling up", noremap = true, silent = true })
keymap.set("n", "n", "nzz", { desc = "Keep searching result in the middle", noremap = true, silent = true })
keymap.set("n", "N", "Nzz", { desc = "Keep searching result in the middle", noremap = true, silent = true })
keymap.set("n", "<a-down>", "<cmd>TSTextobjectGotoNextStart @function.outer<cr>", { desc = "[MOTION] Move to next method", noremap = true, silent = true })
keymap.set("n", "<a-up>", "<cmd>TSTextobjectGotoPreviousStart @function.outer<cr>", { desc = "[MOTION] Move to previous method", noremap = true, silent = true })

-- Buffers
keymap.set("n", "<a-left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "[BUFFER] Go previous buffer", noremap = true, silent = true })
keymap.set("n", "<a-right>", "<cmd>BufferLineCycleNext<cr>", { desc = "[BUFFER] Go next buffer", noremap = true, silent = true })
keymap.set("n", "<a-b>", "<cmd>e #<cr>", { desc = "[BUFFER] Switch to other buffer", noremap = true, silent = true })
keymap.set("n", "<a-t>", "<cmd>ene<cr>", { desc = "[BUFFER] Open a new empty buffer", noremap = true, silent = true })
keymap.set("n", "Z", "<cmd>wall<cr>", { desc = "[BUFFER] Save all", noremap = true, silent = true })
keymap.set("n", "Q", "<cmd>qall!<cr>", { desc = "[BUFFER] Quit all without saving", noremap = true, silent = true })
keymap.set("n", "<a-q>", "<cmd>Bdelete!<cr>", { desc = "[BUFFER] Close current buffer", noremap = true, silent = true })
keymap.set("n", "<a-w>", "<cmd>%bd!|e#|bd#<cr>", { desc = "[BUFFER] Close other buffers", noremap = true, silent = true })

-- Folds
keymap.set("n", "|", "za", { desc = "[FOLDS] Toggle fold", noremap = true, silent = true })
keymap.set("n", "--", "zA", { desc = "[FOLDS] Toggle all folds", noremap = true, silent = true })
keymap.set("n", "<a-s-down>", "zr", { desc = "[FOLDS] Increase fold level", noremap = true, silent = true })
keymap.set("n", "<a-s-up>", "zm", { desc = "[FOLDS] Decrease fold level", noremap = true, silent = true })

-- Macros and registers
keymap.set("n", "t", '"_', { desc = "Set black hole registry", noremap = true, silent = true })
keymap.set("n", "qj", "@q", { desc = "Execute macro saved in 'q' register", noremap = true, silent = true })

-- Find
keymap.set("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "[TELESCOPE] Git commits", noremap = true, silent = true })
keymap.set("n", "<leader>fb", "<cmd>Telescope git_branches<cr>", { desc = "[TELESCOPE] Git branches", noremap = true, silent = true })
keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "[TELESCOPE] Git status", noremap = true, silent = true })
keymap.set("n", "<leader>fg", "<cmd>Telescope git_stash<cr>", { desc = "[TELESCOPE] Git stash", noremap = true, silent = true })

-- Views
keymap.set("n", "<leader>e", "<cmd>NeoTreeFocusToggle<cr>", { desc = "[NEOTREE] Toggle file tree view", noremap = true, silent = true })
keymap.set("n", "<leader>vp", "<cmd>Trouble diagnostics<cr>", { desc = "[TROUBLE] Toggle problem and diagnostics view", noremap = true, silent = true })
keymap.set("n", "<leader>vs", "<cmd>AerialToggle<cr>", { desc = "[AERIAL] Toggle file structure view", noremap = true, silent = true })
keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "[UNDOTREE]Toggle last undoable changes view", noremap = true, silent = true })

-- Code navigation
keymap.set("n", "<leader>cl", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "[LSP] Go to declaration", noremap = true, silent = true })
keymap.set("n", "<leader>cd", "<cmd>Glance definitions<cr>", { desc = "[LSP] Go to definition", noremap = true, silent = true })
keymap.set("n", "<leader>ct", "<cmd>Glance type_definitions<cr>", { desc = "[LSP] Go to type definition", noremap = true, silent = true })
keymap.set("n", "<leader>ci", "<cmd>Telescope lsp_implementations<cr>", { desc = "[LSP] Go to implementation", noremap = true, silent = true })
keymap.set("n", "<leader>cs", "<cmd>lua require'jdtls'.super_implementation()<cr>", { desc = "[JDLTS] Go to super implementation", noremap = true, silent = true })
keymap.set("n", "<leader>cr", "<cmd>Telescope lsp_references<cr>", { desc = "[LSP] Go to references", noremap = true, silent = true })
keymap.set("n", "<leader>cv", "<cmd>Lspsaga hover_doc<cr>", { desc = "[LSP] Hover", noremap = true, silent = true })
keymap.set("n", "<leader>cc", "<cmd>Telescope lsp_incoming_calls<cr>", { desc = "[LSP] Show incoming Calls", noremap = true, silent = true })
keymap.set("n", "<leader>ch", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "[LSP] Signature Help", noremap = true, silent = true })
keymap.set("n", "<leader>cx", "<cmd>lua require'telescope.builtin'.treesitter{ symbols = {'method', 'function', 'function_definition'}}<cr>", { desc = "[TELESCOPE] Get current buffer functions", noremap = true, silent = true })

-- Refactoring
keymap.set("n", "<leader>re", "<cmd>Lspsaga code_action<cr>", { desc = "[LSP] Code actions", noremap = true, silent = true })
keymap.set("n", "<leader>rf", "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<cr>", { desc = "[CONFORM] Format code", noremap = true, silent = true })
keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", { desc = "[LSP] Rename", noremap = true, silent = true })
keymap.set("n", "<leader>ri", "<cmd>:Refactor inline_var <cr>", { desc = "[REFACTOR] Inline variable", noremap = true, silent = true })
keymap.set("n", "<leader>rI", "<cmd>:Refactor inline_func <cr>", { desc = "[REFACTOR] Inline function", noremap = true, silent = true })

-- Errors and diagnostics
keymap.set("n", "<leader>en", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "[DIAG] Go to next error", noremap = true, silent = true })
keymap.set("n", "<leader>ep", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "[DIAG] Go to previous error", noremap = true, silent = true })

-- Git
keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>", { desc = "[GIT] Diff", noremap = true, silent = true })
keymap.set("n", "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", { desc = "[GIT] Next hunk", noremap = true, silent = true })
keymap.set("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", { desc = "[GIT] Prev hunk", noremap = true, silent = true })
keymap.set("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", { desc = "[GIT] Preview hunk", noremap = true, silent = true })

-- Jumps/Marks
keymap.set("n", "<leader>jk", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "[HARPOON] Show quick menu", noremap = true, silent = true })
keymap.set("n", "<leader>ja", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "[HARPOON] Add file", noremap = true, silent = true })

keymap.set("i", "jk", "<Esc>", { desc = "Normal mode switch", noremap = true, silent = true })
keymap.set("i", "<a-b>", "<C-o>b", { desc = "Move to previous word", noremap = true, silent = true })
keymap.set("i", "<a-c>", '<C-o>"_ciw', { desc = "Change word", noremap = true, silent = true })
keymap.set("i", "<a-d>", '<C-o>"_diw', { desc = "Delete word", noremap = true, silent = true })
keymap.set("i", "<a-e>", "<ESC>ea", { desc = "Move to end of word", noremap = true, silent = true })
keymap.set("i", "<a-j>", "<ESC>:m .+1<cr>==gi", { desc = "[MOVE] Move block down", noremap = true, silent = true })
keymap.set("i", "<a-k>", "<ESC>:m .-2<cr>==gi", { desc = "[MOVE] Move block up", noremap = true, silent = true })
keymap.set("i", "<a-s>", "<Del>", { desc = "Handy DEL on insert mode", noremap = true, silent = true })
keymap.set("i", "<a-w>", "<C-o>w", { desc = "Move to next word", noremap = true, silent = true })

keymap.set("v", "<c-s>", "ggOG", { desc = "[SELECT] Select all", noremap = true, silent = true })
keymap.set("v", "v", "^o$", { desc = "[SELECT] Select trimmed line", noremap = true, silent = true })
keymap.set("v", "C", '"_C', { desc = "Do not copy when changing", noremap = true, silent = true })
keymap.set("v", "c", '"_c', { desc = "Do not copy when changing", noremap = true, silent = true })
keymap.set("v", "cc", '"_cc', { desc = "Do not copy when changing", noremap = true, silent = true })
keymap.set("v", "p", '"_dP', { desc = "Paste without replacing what is was in clipboard", noremap = true, silent = true })
keymap.set("v", "<a-j>", ":m '>+1<cr>gv=gv", { desc = "[MOVE] Move block down", noremap = true, silent = true })
keymap.set("v", "<a-k>", ":m '<-2<cr>gv=gv", { desc = "[MOVE] Move block up", noremap = true, silent = true })
keymap.set("v", "<a-down>", "<cmd>TSTextobjectGotoNextStart @function.outer<cr>", { desc = "[MOTION] Move to next method", noremap = true, silent = true })
keymap.set("v", "<a-up>", "<cmd>TSTextobjectGotoPreviousStart @function.outer<cr>", { desc = "[MOTION] Move to previous method", noremap = true, silent = true })
keymap.set("v", "<", "<gv", { desc = "[Indent] Indent left", noremap = true, silent = true })
keymap.set("v", ">", ">gv", { desc = "[Indent] Indent right", noremap = true, silent = true })

-- EXECUTION MODE MAPPINGS
keymap.set("x", "<leader>rl", "<cmd>:Refactor extract_to_file <cr>", { desc = "[REFACTOR] Extract to file", noremap = true, silent = true })
keymap.set("x", "<leader>rv", "<cmd>:Refactor extract_var <cr>", { desc = "[REFACTOR] Extract variable", noremap = true, silent = true })
keymap.set("x", "<leader>rx", "<cmd>:Refactor extract <cr>", { desc = "[REFACTOR] Extract function", noremap = true, silent = true })

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
  vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result)
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
      vim.lsp.util.jump_to_location(target, "utf-8")
      vim.cmd("tabnew %")
    end
  end)
end, { noremap = true, silent = true, desc = "Go to definition in a new tab" })
