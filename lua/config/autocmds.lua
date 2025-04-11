vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt.paste = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})
