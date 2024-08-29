vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- Normal mode mappings (optional, but can be useful)
vim.api.nvim_set_keymap("n", "<A-BS>", "db", { noremap = true })
vim.api.nvim_set_keymap("n", "<D-BS>", "d0", { noremap = true })

-- Define key mappings for macOS-like behavior
vim.api.nvim_set_keymap("i", "<A-BS>", "<C-w>", { noremap = true })
vim.api.nvim_set_keymap("i", "<D-BS>", "<C-u>", { noremap = true })

-- Terminal mode mappings
vim.api.nvim_set_keymap("t", "<A-BS>", "<C-w>", { noremap = true })
vim.api.nvim_set_keymap("t", "<D-BS>", "<C-u>", { noremap = true })

-- VSCode-like commenting
vim.api.nvim_set_keymap("n", "<D-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<D-/>", "gc", { noremap = false })

-- Indent/dedent mappings
vim.keymap.set("v", "<D-[>", "<gv")
vim.keymap.set("v", "<D-]>", ">gv")

-- Error expanding
vim.keymap.set("n", "<C-.>", vim.diagnostic.open_float)
