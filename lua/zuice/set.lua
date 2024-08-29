-- Random vim editor stuff
vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

-- FileType specific tab spaces
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	command = "setlocal shiftwidth=4 tabstop=4",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rs",
	command = "setlocal shiftwidth=4 tabstop=4",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "py",
	command = "setlocal shiftwidth=4 tabstop=4",
})
