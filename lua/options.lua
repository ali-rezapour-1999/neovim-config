require "nvchad.options"

local options = {
  -- File encoding
  encoding = "utf-8",
  fileencoding = "utf-8",
  number = true,
  showcmd = true,
  showmode = false,
  signcolumn = "yes",
  cmdheight = 1,
  laststatus = 3,
  pumheight = 10,

  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  smartcase = true,

  autoindent = true,
  smartindent = true,
  shiftwidth = 2,
  tabstop = 2,

  backup = false,
  splitbelow = true,
  splitright = true,
  scrolloff = 10,
  mouse = "a",
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

if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
end

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
