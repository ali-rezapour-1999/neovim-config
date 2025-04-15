vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_cmp = "blink.cmp"

local options = {
    -- File encoding
    encoding = "utf-8",
    fileencoding = "utf-8",
    
    -- Display options
    number = true,
    relativenumber = true,
    cursorline = true,
    title = true,
    showcmd = true,
    showmode = false,
    signcolumn = "yes",
    cmdheight = 1,
    laststatus = 3,
    pumheight = 10,
    
    -- Search options
    hlsearch = true,
    incsearch = true,
    ignorecase = true,
    smartcase = true,
    
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
    clipboard = "unnamedplus"
        }

for key, value in pairs(options) do
    vim.opt[key] = value
end

vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.shortmess:append("c")
vim.opt.formatoptions:append({ "r" })

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])
vim.cmd([[set fcs=eob:\ ]])
vim.cmd([[filetype plugin indent on]])

if vim.fn.has("nvim-0.8") == 1 then
    vim.opt.cmdheight = 0
end

vim.filetype.add({
    extension = {
        mdx = "mdx",
    },
})

