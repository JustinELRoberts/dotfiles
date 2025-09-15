return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local barbar = require("barbar")
    barbar.setup({
      clickable = false,
      icons = {
        button = "",
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true },
          [vim.diagnostic.severity.WARN] = { enabled = true },
          [vim.diagnostic.severity.INFO] = { enabled = false },
          [vim.diagnostic.severity.HINT] = { enabled = false },
        },
        gitsigns = {
          added = { enabled = true, icon = '+' },
          changed = { enabled = true, icon = '~' },
          deleted = { enabled = true, icon = '-' },
        },
      }
    })

    -- Go to a specific buffer
    vim.keymap.set("", "<leader>bb", ":BufferPick 1<CR>")
    vim.keymap.set("", "<leader>b1", ":BufferGoto 1<CR>")
    vim.keymap.set("", "<leader>b2", ":BufferGoto 2<CR>")
    vim.keymap.set("", "<leader>b3", ":BufferGoto 3<CR>")
    vim.keymap.set("", "<leader>b4", ":BufferGoto 4<CR>")
    vim.keymap.set("", "<leader>b5", ":BufferGoto 5<CR>")
    vim.keymap.set("", "<leader>b6", ":BufferGoto 6<CR>")
    vim.keymap.set("", "<leader>b7", ":BufferGoto 7<CR>")
    vim.keymap.set("", "<leader>b8", ":BufferGoto 8<CR>")
    vim.keymap.set("", "<leader>b9", ":BufferGoto 9<CR>")

    -- Delete the current buffer
    vim.keymap.set('n', '<leader>bd', ':BufferClose<CR>')
    -- Delete all buffers except the currenly open one
    vim.keymap.set('n', '<leader>bo', ':BufferCloseAllButCurrent<CR>')
    -- Delete all buffers except pinned (which I never do, so all)
    vim.keymap.set('n', '<leader>ba', ':BufferCloseAllButPinned<CR>')
    -- Delete all buffers to the left
    vim.keymap.set('n', '<leader>bl', ':BufferCloseBuffersLeft<CR>')
    -- Delete all buffers to the right
    vim.keymap.set('n', '<leader>br', ':BufferCloseBuffersRight<CR>')

    -- Go N buffers to the left/right
    vim.keymap.set('n', ']b', function()
      local count = vim.v.count
      if count == 0 then
        count = 1
      end
      for _ = 1, count
      do
        vim.cmd('BufferNext')
      end
    end)
    vim.keymap.set('n', '[b', function()
      local count = vim.v.count
      if count == 0 then
        count = 1
      end
      for _ = 1, count
      do
        vim.cmd('BufferPrevious')
      end
    end)

    -- Move (reorder) the current buffer N buffers to the left/right
    vim.keymap.set('n', ']B', function()
      local count = vim.v.count
      if count == 0 then
        count = 1
      end
      for _ = 1, count
      do
        vim.cmd('BufferMoveNext')
      end
    end)
    vim.keymap.set('n', '[B', function()
      local count = vim.v.count
      if count == 0 then
        count = 1
      end
      for _ = 1, count
      do
        vim.cmd('BufferMovePrevious')
      end
    end)
  end
}
