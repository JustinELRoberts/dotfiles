return {
  "rachartier/tiny-glimmer.nvim",
  event = "VeryLazy",
  priority = 10, -- Needs to be a really low priority, to catch others plugins keybindings.
  config = function()
    require('tiny-glimmer').setup({
      overwrite = {
        yank = {
          enabled = true,
          default_animation = {
            name = "fade",
            settings = {
              from_color = "Visual",
              min_duration = 200,
              max_duration = 200,
            }
          },
        },

        paste = {
          enabled = true,
          default_animation = {
            name = "reverse_fade",
            settings = {
              from_color = "DiffAdd",
              min_duration = 200,
              max_duration = 200,
            }
          },
          -- Key to paste
          paste_mapping = "p",
          -- Key to paste above the cursor
          Paste_mapping = "P",
        },

        undo = {
          enabled = true,
          default_animation = {
            name = "reverse_fade",
            settings = {
              from_color = "DiffDelete",
              min_duration = 200,
              max_duration = 200,
            }
          },
          undo_mapping = "u",
        },

        redo = {
          enabled = true,
          default_animation = {
            name = "reverse_fade",
            settings = {
              from_color = "DiffAdd",
              min_duration = 200,
              max_duration = 200,
            }
          },
          redo_mapping = "<c-r>",
        },
      },
    })
  end
}
