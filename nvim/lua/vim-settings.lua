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

-- Keep undo history across restarts (stored in ~/.local/state/nvim/undo/)
vim.opt.undofile = true

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
vim.opt.clipboard = "unnamedplus"

-- Over SSH there is no local clipboard tool to hand the yank to, so round-trip it
-- through the terminal with OSC 52. Nvim does this on its own, but only when it finds
-- no clipboard tool on the remote host -- force it so a stray xclip/wl-copy over there
-- can't quietly capture the yank into *that* machine's clipboard instead.
if vim.env.SSH_TTY then
  local osc52 = require("vim.ui.clipboard.osc52")
  vim.g.clipboard = {
    name = "OSC 52",
    copy = { ["+"] = osc52.copy("+"), ["*"] = osc52.copy("*") },
    paste = { ["+"] = osc52.paste("+"), ["*"] = osc52.paste("*") },
  }
end

-- Since every yank/delete goes to the clipboard, keep the two operations that
-- destroy it without copying anything from doing so.
-- Visual-mode `p` swaps the clipboard for the text it overwrote; `P` doesn't.
vim.keymap.set("x", "p", "P")
-- A single-character delete is never worth losing the clipboard over.
vim.keymap.set({ "n", "x" }, "x", '"_x')

-- Rounded borders around LSP autocomplete etc
vim.o.winborder = 'rounded'
