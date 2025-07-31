-- Set tab to 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.scrolloff = 10

-- Show line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Highlight the selected row
vim.opt.cursorline = true

-- Keybinds to save/quit
vim.keymap.set('n', '<leader>q', ':wqa<CR>')
vim.keymap.set('v', '<leader>q', '<Esc><CR>:wqa<CR>')

vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('v', '<leader>w', '<Esc><CR>:w<CR>')

-- Keybinds to execute some lua
vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>')
vim.keymap.set('n', '<leader>x', ':.lua<CR>')
vim.keymap.set('v', '<leader>x', ':lua<CR>')

-- Allow yank to clipboard
if vim.fn.has("unnamedplus") then
  vim.g.clipboard = unnamedplus
else
  vim.g.clipboard = unnamed
end

-- Rounded borders around LSP autocomplete etc
vim.o.winborder = 'rounded'
