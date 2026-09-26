return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local setup = function()
      require("lualine").setup({
        options = {
          theme = "auto"
        }
      })
    end
    setup()

    -- "auto" resolves the theme once at setup, so redo it whenever the colorscheme
    -- reloads (e.g. auto-dark-mode flipping `background` between dragon and wave)
    vim.api.nvim_create_autocmd("ColorScheme", { callback = setup })
  end
}
