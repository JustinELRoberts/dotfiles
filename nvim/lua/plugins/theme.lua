return {
  {
    -- Automatically toggles light/dark mode based on OS settings
    "f-person/auto-dark-mode.nvim",
    opts = {
      set_dark_mode = function()
        vim.o.background = "dark"
      end,
      set_light_mode = function()
        vim.o.background = "light"
      end,
    }
  },
  {
    -- Actual theme
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        compile = false,
        undercurl = false,
        commentStyle = { italic = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        background = {
          dark = "dragon",
          light = "wave"
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            -- Dark popup for autocomplete etc
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatFooter = { bg = "none" },
            FloatTitle = { bg = "none" },
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
      })

      -- setup must be called before loading
      vim.cmd("colorscheme kanagawa")
    end,
  }
}
