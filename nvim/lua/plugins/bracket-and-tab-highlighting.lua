return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = {
    'HiPhish/rainbow-delimiters.nvim',
  },
  main = "ibl",
  opts = {},
  config = function()
    local highlight = {
      "RainbowYellow",
      "RainbowGreen",
      "RainbowBlue",
      "RainbowViolet",
    }
    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    end)

    require('rainbow-delimiters.setup').setup({ highlight = highlight })
    require("ibl").setup({ scope = { highlight = highlight }, indent = { char = '┊' } })

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end
}
