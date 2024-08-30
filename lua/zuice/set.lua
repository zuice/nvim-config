-- Random vim editor stuff
vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.list = true
vim.opt.listchars = {
	space = "·",
	tab = "→ ",
	eol = "↵",
	trail = "•",
	extends = "❯",
	precedes = "❮",
}
-- Change the color of listchars
vim.cmd([[highlight SpecialKey ctermfg=DarkGray guifg=#5c6370]])
-- Show trailing whitespace as red
vim.cmd([[highlight ExtraWhitespace ctermbg=red guibg=red]])
vim.cmd([[match ExtraWhitespace /\s\+$/]])

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
