vim.g.mapleader = " "

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true

vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_picker = "telescope"

local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",

  -- Display options
  number = true,
  relativenumber = true,
  showcmd = true,
  showmode = false,
  cmdheight = 1,
  laststatus = 3,

  -- Indentation and tabs
  autoindent = true,
  smartindent = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,

  -- File handling
  backup = false,
  undodir = "/tmp/.nvimdid",
  splitbelow = true,
  splitright = true,
  splitkeep = "cursor",
  scrolloff = 10,
  mouse = "a",
  wrap = false,
  backspace = { "start", "eol", "indent" },

  shell = "fish",
  backupskip = { "/tmp/*", "/private/tmp/*" },
  inccommand = "split",
  breakindent = true,
  clipboard = "unnamedplus",
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.g.lazyvim_check_order = false

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
