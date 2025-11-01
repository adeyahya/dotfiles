return {
  {
    "catppuccin/nvim",
    name = "catppuccin",

    -- 1. Set a high priority and disable lazy loading.
    --    This ensures the colorscheme loads before other plugins apply their colors.
    lazy = false,
    priority = 1000,

    -- 2. Use the 'config' function to set up and apply the theme
    config = function()
      require("catppuccin").setup({
        -- ** Set the default flavor to Mocha **
        flavour = "mocha",

        -- Other common configurations (optional)
        transparent_background = true, -- Set to true for terminal background passthrough

        -- Automatically enable integrations for many other plugins you have installed
        auto_integrations = true,

        -- You can define which flavor to use for light/dark mode if you toggle them
        background = {
          light = "latte",
          dark = "mocha",
        },

        -- Add any custom style or highlight overrides here
        styles = {
          comments = { "italic" },
        },
      })

      -- 3. Apply the colorscheme
      vim.cmd.colorscheme "catppuccin"
      -- You can also use "catppuccin-mocha" directly here,
      -- but "catppuccin" is safer as it respects the 'flavour' option above.
    end,
  },
}
